package com.website.WebsiteBanHang.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.WebsiteBanHang.entities.UserType;
import com.website.WebsiteBanHang.repository.UserTypeRepository;
import com.website.WebsiteBanHang.service.UserTypeService;

@Transactional
@Service
public class UserTypeServiceImpl implements UserTypeService {

	@Autowired
	private UserTypeRepository userTypeReposity;

	@Override
	public void createDefaultUserTypes() {

		UserType adminType = new UserType();
		adminType.setName("SUPPER_ADMIN");
		userTypeReposity.save(adminType);

		UserType adminType1 = new UserType();
		adminType1.setName("MANAGER");
		userTypeReposity.save(adminType1);

		UserType adminType2 = new UserType();
		adminType2.setName("EMPLOYEE");
		userTypeReposity.save(adminType2);

	}

	@Override
	public List<UserType> getAll() {
		return this.userTypeReposity.findAll();
	}

}