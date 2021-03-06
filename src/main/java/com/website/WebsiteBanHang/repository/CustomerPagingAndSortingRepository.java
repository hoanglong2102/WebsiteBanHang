package com.website.WebsiteBanHang.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.Customer;

@Repository
public interface CustomerPagingAndSortingRepository extends PagingAndSortingRepository<Customer, Long> {

}
