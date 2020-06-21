package com.website.WebsiteBanHang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.WebsiteBanHang.entities.Customer;
import com.website.WebsiteBanHang.repository.CustomerPagingAndSortingRepository;
import com.website.WebsiteBanHang.repository.CustomerRepository;
import com.website.WebsiteBanHang.service.CustomerService;

@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private CustomerPagingAndSortingRepository customerPagingAndSortingRepository;

	@Override
	public Customer getCustomer(Long id) {
		// TODO Auto-generated method stub
		return customerRepository.getOne(id);
	}

	@Override
	public List<Customer> getAll() {
		// TODO Auto-generated method stub
		return customerRepository.findAll();
	}

	public String add(Customer customer) {

		customer.setFullName(customer.getLastName() + " " + customer.getFirstName());
		String errorMessage = "";

		if (customer.getNumberPhone().isEmpty()) {
			errorMessage = "Số điện thoại không được bỏ trống";
			return errorMessage;
		}
		if (customer.getCity().isEmpty()) {
			errorMessage = "Tỉnh/Thành phố không được bỏ trống";
			return errorMessage;
		}

		if (customer.getDistrict().isEmpty()) {
			errorMessage = "Quận/Huyện không được bỏ trống";
			return errorMessage;
		}
		if (customer.getEmail().isEmpty()) {
			errorMessage = "email không được bỏ trống";
			return errorMessage;
		}
		if (customer.getLastName().isEmpty() || customer.getFirstName().isEmpty()) {
			errorMessage = "Tên không được bỏ trống";
			return errorMessage;
		}

		this.customerRepository.save(customer);
		return null;
	}

	public String update(Customer customer) {
		String errorMessage = "";

		if (customer.getNumberPhone().isEmpty()) {
			errorMessage = "Số điện thoại không được bỏ trống";
			return errorMessage;
		}
		if (customer.getCity().isEmpty()) {
			errorMessage = "Tỉnh/Thành phố không được bỏ trống";
			return errorMessage;
		}

		if (customer.getDistrict().isEmpty()) {
			errorMessage = "Quận/Huyện không được bỏ trống";
			return errorMessage;
		}
		if (customer.getEmail().isEmpty()) {
			errorMessage = "email không được bỏ trống";
			return errorMessage;
		}
		if (customer.getLastName().isEmpty() || customer.getFirstName().isEmpty()) {
			errorMessage = "Tên không được bỏ trống";
			return errorMessage;
		}
		this.customerRepository.save(customer);
		return null;
	}

	@Override
	public void delete(Customer customer) {
		// TODO Auto-generated method stub
		customerRepository.delete(customer);
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		Customer customer = customerRepository.getOne(id);
		customerRepository.delete(customer);
	}

	@Override
	public List<Customer> searchCustomerByFullNameAndPhoneNumber(String fullNameandPhonenumber) {
		return this.customerRepository.findCustomerByFullNameAndPhoneNumber(fullNameandPhonenumber);
	}

	@Override
	public Page<Customer> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.customerPagingAndSortingRepository.findAll(paging);
	}

	@Override
	public List<Customer> searchByCustomerPhoneNumber(String phoneNumber) {
		this.customerRepository.findByPhoneNumber(phoneNumber);
		return null;
	}

}
