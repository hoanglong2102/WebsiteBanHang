package com.website.WebsiteBanHang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.WebsiteBanHang.entities.Manufacturer;
import com.website.WebsiteBanHang.repository.ManufacturerPagingAndSortingRepository;
import com.website.WebsiteBanHang.repository.ManufacturerRepository;
import com.website.WebsiteBanHang.service.ManufacturerService;

@Transactional
@Service
public class ManufacturerServiceImpl implements ManufacturerService {
	@Autowired
	private ManufacturerRepository manufacturerRepository;

	@Autowired
	private ManufacturerPagingAndSortingRepository manufacturerPagingAndSortingRepository;

	public Manufacturer getManufacturer(Long id) {
		Manufacturer manufacturer = this.manufacturerRepository.getOne(id);
		return manufacturer;
	}

	public List<Manufacturer> getAll() {

		return this.manufacturerRepository.findAll();
	}

	public String add(Manufacturer manufacturer) {
		String errorMessage = "";
		if (manufacturer.getManufacturerName().isEmpty()) {
			errorMessage = "Vui lòng nhập tên nhà sản xuất!";

			return errorMessage;
		}
		if (manufacturer.getPhoneNumber().isEmpty()) {
			errorMessage = "Vui lòng nhập số điện thoại!";

			return errorMessage;
		}
		if (manufacturer.getStreet().isEmpty()) {
			errorMessage = "Vui lòng nhập đường!";

			return errorMessage;
		}
		if (manufacturer.getDistrict().isEmpty()) {
			errorMessage = "Vui lòng nhập quận/huyện!";

			return errorMessage;
		}
		if (manufacturer.getCity().isEmpty()) {
			errorMessage = "Vui lòng nhập tỉnh/thành phố!";

			return errorMessage;
		}

		if (manufacturer.getLogo() == null || manufacturer.getLogo().isEmpty()) {
			errorMessage = "Vui lòng chọn hình ảnh!";

			return errorMessage;
		}
		if (manufacturer.getEmail().isEmpty()) {
			errorMessage = "Vui lòng nhập email!";

			return errorMessage;
		}
		this.manufacturerRepository.save(manufacturer);

		return null;
	}

	public String update(Manufacturer manufacturer) {
		String errorMessage = "";
		if (manufacturer.getManufacturerName().isEmpty()) {
			errorMessage = "Vui lòng nhập tên nhà sản xuất!";

			return errorMessage;
		}
		if (manufacturer.getPhoneNumber().isEmpty()) {
			errorMessage = "Vui lòng nhập số điện thoại!";

			return errorMessage;
		}

		if (manufacturer.getStreet().isEmpty()) {
			errorMessage = "Vui lòng nhập đường!";

			return errorMessage;
		}
		if (manufacturer.getDistrict().isEmpty()) {
			errorMessage = "Vui lòng nhập quận/huyện!";

			return errorMessage;
		}
		if (manufacturer.getCity().isEmpty()) {
			errorMessage = "Vui lòng nhập tỉnh/thành phố!";

			return errorMessage;
		}

		if (manufacturer.getLogo() == null || manufacturer.getLogo().isEmpty()) {
			errorMessage = "Vui lòng chọn hình ảnh!";

			return errorMessage;
		}
		if (manufacturer.getEmail().isEmpty()) {
			errorMessage = "Vui lòng nhập email!";

			return errorMessage;
		}
//		if (publisher.getEmail()!="^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$") {
//			errorMessage = "Email không đúng chuẩn";
//
//			return errorMessage;
//		}
		this.manufacturerRepository.save(manufacturer);

		return null;
	}

	public void delete(Manufacturer manufacturer) {
		manufacturerRepository.delete(manufacturer);
	}

	public void delete(Long id) {
		Manufacturer manufacturer = this.manufacturerRepository.getOne(id);
		manufacturerRepository.delete(manufacturer);

	}

	@Override
	public List<Manufacturer> getFindManufacturer(String manufacturerName) {
		return manufacturerRepository.getFindManufacturer(manufacturerName);
	}

	@Override
	public Page<Manufacturer> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.manufacturerPagingAndSortingRepository.findAll(paging);
	}

	@Override
	public void createDefaultManufacturer() throws Exception {
		Manufacturer manufacturer = new Manufacturer();
		manufacturer.setManufacturerName("Samsung");
		manufacturer.setLogo("logoss.png");
		manufacturer.setPhoneNumber("02839157310");
		manufacturer.setEmail("info@mkt.samsung.com");
		manufacturer.setStreet(" Số 2, đường Hải Triều, Phường Bến Nghé");
		manufacturer.setDistrict("Quận 1");
		manufacturer.setCity("Tp.HCM");
		manufacturerRepository.save(manufacturer);

	}

}
