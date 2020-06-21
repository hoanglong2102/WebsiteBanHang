package com.website.WebsiteBanHang.configuration;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.website.WebsiteBanHang.service.CategoryService;
import com.website.WebsiteBanHang.service.UserService;
import com.website.WebsiteBanHang.service.UserTypeService;
import com.website.WebsiteBanHang.service.impl.ManufacturerServiceImpl;
import com.website.WebsiteBanHang.service.impl.ProductServiceImpl;

@Component
public class InitializationLoader {

	@Autowired
	private UserService userService;
	@Autowired
	private ProductServiceImpl productService;	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserTypeService userTypeService;

	@Autowired
	private ManufacturerServiceImpl manufacturerService;
	
	@PostConstruct
	public void init() throws Exception {
		try {
			if (userService.getByUserName("admin") == null) {
//				permissonService.createDefaultPermissions();
				userService.createDefaultAdmin();
				userTypeService.createDefaultUserTypes();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		createDefaultManager();
		createDefaultEmployee();
		createDefaultProduct();
		createDefaultCategory();
		createDefaultManufacturer();

	}

	void createDefaultManager() {
		try {
			if (userService.getAllManagers().size() <= 0) {
				userService.createDefaultManager();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void createDefaultEmployee() {
		try {
			if (userService.getAllEmployees().size() <= 0) {
				userService.createDefaultEmployee();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void createDefaultProduct() {
		try {
			if (productService.getAll().size() <= 0) {
				productService.createDefaultProduct();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	void createDefaultCategory() {
		try {
			if (categoryService.getAll().size() <= 0) {
				categoryService.createDefaultCategory();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	void createDefaultManufacturer() {
		try {
			if(manufacturerService.getAll().size()<=0) {
				manufacturerService.createDefaultManufacturer();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
