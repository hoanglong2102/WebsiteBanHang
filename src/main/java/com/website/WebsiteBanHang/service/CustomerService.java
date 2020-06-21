package com.website.WebsiteBanHang.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.website.WebsiteBanHang.entities.Customer;

public interface CustomerService {
	public Customer getCustomer(Long id);

	public List<Customer> getAll();

	public String add(Customer customer);

	public String update(Customer customer);

	public void delete(Customer customer);

	public void delete(Long id);

	public List<Customer> searchCustomerByFullNameAndPhoneNumber(String fullNameandPhonenumber);

	public List<Customer> searchByCustomerPhoneNumber(String phoneNumber);

	public Page<Customer> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy);

}
