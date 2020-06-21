package com.website.WebsiteBanHang.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.Order;

@Repository
public interface OrderPagingAndSortingRepository extends PagingAndSortingRepository<Order, Long> {

}
