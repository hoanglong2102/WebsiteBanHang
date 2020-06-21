package com.website.WebsiteBanHang.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.WebsiteBanHang.entities.User;
import com.website.WebsiteBanHang.repository.UserRepository;
import com.website.WebsiteBanHang.service.UserTypeService;
import com.website.WebsiteBanHang.service.impl.ImageServiceImpl;
import com.website.WebsiteBanHang.service.impl.UserServiceImpl;

@Controller
@RequestMapping(value = "/admin/user")
public class UserController {

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private ImageServiceImpl imageService;

	@Autowired
	private UserRepository userRepository;
	/*
	 * @Autowired private PermissionServiceImpl permissonService;
	 */

	@Autowired
	private UserTypeService userTypeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getUsers(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("user-users");

		Page<User> users = this.userService.getAllWithPagination(page, size, "id");
//		List<User> users = this.userService.getAll();
		model.addObject("currentPage", page);
		model.addObject("users", users);

		return model;
	}

	@RequestMapping(value = "/getUser/{userId}", method = RequestMethod.GET)
	public ModelAndView getUser(@PathVariable("userId") Long id, @RequestParam("mode") String mode,
			ModelAndView model) {

		if (mode.equals("EDIT")) {
			model.setViewName("user-userUpdate");
		} else {
			model.setViewName("user-userDetail");
		}

		User user = userService.getUser(id);
//		List<Permission> permissions = this.permissonService.getAll();

		model.addObject("user", user);
//		model.addObject("allPermission", permissions);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public ModelAndView addStudent(ModelAndView model) {
		model.setViewName("user-userUpdate");
//		List<Permission> permissions = this.permissonService.getAll();
//		model.addObject("permissions", permissonService.getAll());
		model.addObject("userTypes", userTypeService.getAll());
		model.addObject("user", new User());
		model.addObject("mode", "ADD");
//		model.addObject("allPermission", permissions);
		return model;
	}

	@RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteOrder(@PathVariable Long id) {
		userService.delete(id);
		return "redirect:/admin/user/";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user, Model model, HttpServletRequest request,
			@RequestParam String userName) {

		String uploadRootPath = request.getServletContext().getRealPath("uploads");

		String imageName = imageService.uploadFile(uploadRootPath, user.getProfileImageFile());

//		List<Long> permissonList = user.getPermissionIdList();
//		List<Permission> permissions1 = new ArrayList();
//
//		for (Long permissonId : permissonList) {
//			Permission permission = this.permissonService.getPermisson(permissonId);
//			permissions1.add(permission);
//		}
//		user.setPermissions(permissions1);
		/* String error = userService.checkUserInfo(userName); */
		String error = "";
		String getUserName = user.getUserName();
		User userFindByUserName = userRepository.findByUserName(getUserName);

		String getPhoneNumber = user.getPhoneNumber();
		User userFindByPhoneNumber = userRepository.findByPhoneNumber(getPhoneNumber);

		if (user.getId() == null) {
			user.setProfileImage(imageName);
			if (userFindByUserName != null) {
				error = "Tài khoản đã tồn tại!";
				model.addAttribute("userTypes", userTypeService.getAll());
				model.addAttribute("errorMessage", error);
				model.addAttribute("mode", "ADD");
				return "user-userUpdate";
			} else if (userFindByPhoneNumber != null) {

				error = "Số điện thoại đã được sử dụng!";
				model.addAttribute("userTypes", userTypeService.getAll());
				user = userFindByPhoneNumber;
				model.addAttribute("errorMessage", error);
				model.addAttribute("mode", "ADD");
				return "user-userUpdate";

			}
			String errorMes = userService.add(user);
			if (errorMes != null) {
				model.addAttribute("userTypes", userTypeService.getAll());
				model.addAttribute("errorMessage", errorMes);

				model.addAttribute("mode", "ADD");
				return "user-userUpdate";
			}
			userService.add(user);
		} else {
			if (imageName != null) {
				user.setProfileImage(imageName);
			}
			String errorMes1 = userService.update(user);
			if (errorMes1 != null) {
				model.addAttribute("userTypes", userTypeService.getAll());
				model.addAttribute("errorMessage", errorMes1);
				model.addAttribute("mode", "EDIT");
				return "user-userUpdate";
			}
			userService.update(user);
		}
		return "redirect:/admin/user/";

	}

	@RequestMapping(value = "/searchUser", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam String search, ModelAndView model) {
		boolean kq = false;
		List<User> users = this.userService.searchUserByUserNameAndPhoneNumber(search);
		if (users.size() > 0) {
			model.addObject("users", users);
			kq = true;
		}
		model.addObject("size", users.size());
		model.addObject("search", search);
		model.addObject("ketqua", kq);
		model.setViewName("user-searchUser");
		return model;
	}

}
