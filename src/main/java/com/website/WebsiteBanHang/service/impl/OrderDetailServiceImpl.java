package com.website.WebsiteBanHang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.WebsiteBanHang.entities.OrderDetail;
import com.website.WebsiteBanHang.repository.OrderDetailRepository;
import com.website.WebsiteBanHang.service.OrderDetailService;

@Transactional
@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	public OrderDetail getOrderDetail(Long id) {
		return this.orderDetailRepository.getOne(id);
	}

	public List<OrderDetail> getAll() {
		return this.orderDetailRepository.findAll();
	}

	public OrderDetail update(OrderDetail orderDetail) {
		return this.orderDetailRepository.save(orderDetail);

	}

	public void delete(Long id) {
		OrderDetail orderDetail = this.orderDetailRepository.getOne(id);
		orderDetailRepository.delete(orderDetail);
	}

	public void delete(OrderDetail orderDetail) {
		this.orderDetailRepository.delete(orderDetail);
	}

}
