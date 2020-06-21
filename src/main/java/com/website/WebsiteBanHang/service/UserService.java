package com.website.WebsiteBanHang.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.website.WebsiteBanHang.entities.User;

public interface UserService {

	public User getByUserName(String userName);

	public User getUser(Long id);

	public List<User> getAll();

	public List<User> getAllManagers();

	public List<User> getAllEmployees();

	public String add(User user);

	public String update(User user);

	public void delete(User user);

	public void delete(Long id);

	public void createDefaultAdmin() throws Exception;

	public void createDefaultEmployee() throws Exception;
	
	public void createDefaultManager() throws Exception;

	boolean changePassword(String username, String oldpass, String newpass);

	public String changePassword1(String userName, String newPassword, String retypePassword);

	public Page<User> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy);

	public String checkUserInfo(String username, String phone, String email);

	public String checkUserInfo(String username);

	public List<User> searchByUserName(String userName);

	public List<User> searchUserByUserNameAndPhoneNumber(String userNameandPhonenumber);

}
