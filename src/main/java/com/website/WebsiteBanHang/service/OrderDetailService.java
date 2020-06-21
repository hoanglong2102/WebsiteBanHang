package com.website.WebsiteBanHang.service;

import java.util.List;

import com.website.WebsiteBanHang.entities.OrderDetail;

public interface OrderDetailService {

	public OrderDetail getOrderDetail(Long id);

	public List<OrderDetail> getAll();

	public OrderDetail update(OrderDetail orderDetail);

	public void delete(Long id);

	public void delete(OrderDetail orderDetail);
}
