package com.website.WebsiteBanHang.service;

import java.util.List;

import com.website.WebsiteBanHang.entities.UserType;

public interface UserTypeService {

	void createDefaultUserTypes() throws Exception;

	List<UserType> getAll();
}