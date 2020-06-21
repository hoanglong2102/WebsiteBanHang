package com.website.WebsiteBanHang.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.WebsiteBanHang.entities.User;
import com.website.WebsiteBanHang.service.impl.ImageServiceImpl;
import com.website.WebsiteBanHang.service.impl.UserServiceImpl;

@Controller
@RequestMapping(value = "/profile")
public class UserProfileController {

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private ImageServiceImpl imageService;

	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public ModelAndView getProfile(Principal principal, ModelAndView model) {
		model.setViewName("profile");
		String userName = principal.getName();
		User user = userService.getByUserName(userName);

		model.addObject("user", user);
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveProfile(@ModelAttribute("user") User user, HttpServletRequest request) {

		String uploadRootPath = request.getServletContext().getRealPath("uploads");

		String imageName = imageService.uploadFile(uploadRootPath, user.getProfileImageFile());

		if (user.getId() == null) {
			user.setProfileImage(imageName);
			userService.add(user);
		} else {
			if (imageName != null) {
				user.setProfileImage(imageName);
			}
			userService.update(user);
		}
		return "redirect:/profile/" + user.getId();
	}

	@RequestMapping(value = "/viewchangepassword", method = RequestMethod.GET)
	public ModelAndView viewChangepassword(@RequestParam String username, ModelAndView model) {
		model.setViewName("user-changepassword");
		model.addObject("username", username);
		return model;

	}

	@RequestMapping(value = "/updatepassword/{username}", method = RequestMethod.POST)
	public String updatePassword(@PathVariable("username") String username, HttpServletRequest request,
			@RequestParam String oldpassword, @RequestParam String newpassword, @RequestParam String enterpassword) {
		boolean kq = false;
		String message = "";
		if (enterpassword.equals(newpassword) && oldpassword != "") {
			if (enterpassword == "" || newpassword == "") {
				message = "Vui lòng nhập mật khẩu!";
				kq = false;
			} else {
				if (newpassword.length() < 8) {
					message = "Mật khẩu phải chứa ít nhất 8 ký tự!";
					kq = false;
				} else {
					boolean changepassword = userService.changePassword(username, oldpassword, newpassword);
					if (changepassword) {
						kq = true;
						return "profile-changePasswordSuccess";
					} else {
						message = "Mật khẩu cũ không đúng! vui lòng nhập lại";
						kq = false;
					}
				}

			}
		} else {
			if (!enterpassword.equals(newpassword)) {
				message = "Mật khẩu không trùng khớp !";
				kq = false;
			}
			if (oldpassword == "" || enterpassword == "" || newpassword == "") {
				message = "Vui lòng nhập mật khẩu!";
				kq = false;
			}

		}
		request.setAttribute("message", message);
		request.setAttribute("kq", kq);
		return "user-changepassword";

	}

}
