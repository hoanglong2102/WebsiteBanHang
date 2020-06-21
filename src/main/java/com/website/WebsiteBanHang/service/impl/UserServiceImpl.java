package com.website.WebsiteBanHang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.WebsiteBanHang.entities.User;
import com.website.WebsiteBanHang.entities.UserType;
import com.website.WebsiteBanHang.repository.UserPagingAndSortingRepository;
import com.website.WebsiteBanHang.repository.UserRepository;
import com.website.WebsiteBanHang.repository.UserTypeRepository;
import com.website.WebsiteBanHang.service.UserService;

@Transactional
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserPagingAndSortingRepository userPagingAndSortingRepository;

	@Autowired
	private UserTypeRepository userTypeReposity;

	private static final String DEFAULT_INITIAL_PASSWORD = "admin";

	@Override
	public User getByUserName(String userName) {
		return userRepository.findByUserName(userName);
	}

	@Override
	public User getUser(Long id) {
		return userRepository.getOne(id);
	}

	@Override
	public List<User> getAll() {
		return this.userRepository.findAll();
	}

	@Override
	public List<User> getAllManagers() {
		return userRepository.findAllManager();
	}

	@Override
	public List<User> getAllEmployees() {
		return userRepository.findAlEmployee();
	}

	@Override
	public String add(User user) {
		String errorMessage = "";

		if (user.getLastName().isEmpty() || user.getFirstName().isEmpty()) {
			errorMessage = "Họ tên không được bỏ trống";
			return errorMessage;
		}

		if (user.getEmail().isEmpty()) {
			errorMessage = "Email không được bỏ trống";
			return errorMessage;
		}

		if (user.getUserName().isEmpty()) {
			errorMessage = "Tên đăng nhập không được bỏ trống!";
			return errorMessage;
		}

		String password = passwordEncoder.encode(DEFAULT_INITIAL_PASSWORD);
		user.setPassword(password);
		user.setIsActive(true);

		this.userRepository.save(user);
		return null;
	}

	@Override
	public String update(User user) {
		String errorMessage = "";

		if (user.getLastName().isEmpty() || user.getFirstName().isEmpty()) {
			errorMessage = "Họ tên không được bỏ trống";
			return errorMessage;
		}

		if (user.getEmail().isEmpty()) {
			errorMessage = "Email không được bỏ trống";
			return errorMessage;
		}

		if (user.getUserName().isEmpty()) {
			errorMessage = "Tên đăng nhập không được bỏ trống!";
			return errorMessage;
		}
		this.userRepository.save(user);
		return null;
	}

	@Override
	public void delete(User user) {
		userRepository.delete(user);
	}

	@Override
	public void delete(Long id) {
		User user = userRepository.getOne(id);
		userRepository.delete(user);
	}

	@Override
	public void createDefaultAdmin() throws Exception {
		String password = passwordEncoder.encode(DEFAULT_INITIAL_PASSWORD);
		UserType adminUserType = userTypeReposity.getOne(1L);
		// creation of the super admin admin:password)
		User user = new User();
		user.setUserName("admin");
		user.setPassword(password);
		user.setEmail("admin@greenacedamy.com");
		user.setFirstName("Administrator");
		user.setLastName("User");
		user.setIsActive(true);
		user.setUserType(adminUserType);
		userRepository.save(user);
	}

	@Override
	public void createDefaultEmployee() throws Exception {
		String password = passwordEncoder.encode(DEFAULT_INITIAL_PASSWORD);
		UserType adminUserType = userTypeReposity.getOne(3L);
		// creation of the super admin admin:password)
		User user = new User();
		user.setUserName("employee1");
		user.setPassword(password);
		user.setEmail("employee1@greenacedamy.com");
		user.setFirstName("Employee");
		user.setLastName("User");
		user.setIsActive(true);
		user.setUserType(adminUserType);
		userRepository.save(user);
	}

	@Override
	public void createDefaultManager() throws Exception {
		String password = passwordEncoder.encode(DEFAULT_INITIAL_PASSWORD);
		UserType adminUserType = userTypeReposity.getOne(2L);
		// creation of the super admin admin:password)
		User user = new User();
		user.setUserName("manager1");
		user.setPassword(password);
		user.setEmail("manager1@greenacedamy.com");
		user.setFirstName("Manager");
		user.setLastName("User");
		user.setIsActive(true);
		user.setUserType(adminUserType);
		userRepository.save(user);
	}

	@Override
	public boolean changePassword(String username, String oldpass, String newpass) {
		User user = this.userRepository.findByUserName(username);
		if (user != null) {
			if (passwordEncoder.matches(oldpass, user.getPassword())) {
				String newpassword = passwordEncoder.encode(newpass);
				user.setPassword(newpassword);
				userRepository.save(user);
				return true;
			}
		}
		return false;
	}

	@Override
	public String changePassword1(String userName, String newPassword, String retypePassword) {
		User user = this.userRepository.findByUserName(userName);
		if (user != null) {

			if (newPassword.equals(retypePassword) == false) {
				return "Mật khẩu xác nhận không khớp";
			}
			if (newPassword.length() <= 5) {
				return "Mật khẩu quá ngắn";
			}

			String password = passwordEncoder.encode(newPassword);
			user.setPassword(password);
			userRepository.save(user);
			System.out.println("update thanh cong");

		}
		return null;
	}

	@Override
	public Page<User> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.userPagingAndSortingRepository.findAll(paging);
	}

	@Override
	public String checkUserInfo(String username, String phone, String email) {
		User user = this.userRepository.findByUserNameEmailPhone(username, phone, email);
		if (user == null) {
			return "Thông tin nhập không đúng. Vui lòng kiểm tra lại";
		}

		return null;
	}

	@Override
	public String checkUserInfo(String username) {
		User user = this.userRepository.findByUserName(username);
		if (user != null) {
			return "Tài khoản đã tồn tại";
		}
		return null;
	}

	@Override
	public List<User> searchByUserName(String userName) {
		return this.userRepository.findByUserName1(userName);
	}

	@Override
	public List<User> searchUserByUserNameAndPhoneNumber(String userNameandPhonenumber) {
		return this.userRepository.findUserByUserNameAndPhoneNumber(userNameandPhonenumber);
	}

}
