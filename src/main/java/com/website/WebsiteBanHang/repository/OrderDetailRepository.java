package com.website.WebsiteBanHang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
	@Query("select o from OrderDetail as o where o.order.id = :orderId")
	List<OrderDetail> findOrderDetails(@Param("orderId") Long orderId);

}
