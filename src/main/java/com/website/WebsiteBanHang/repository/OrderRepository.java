package com.website.WebsiteBanHang.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

	@Query("select  p from Order as p join p.customer as c where c.firstName = :firstName")
	List<Order> findByCustomer(@Param("firstName") String firstName);

	@Query("select hd from Order hd")
	List<Order> getAll();

	@Query("select p from Order p where p.id like %:id%")
	List<Order> getFindOrder(@Param("id") Long id);

	@Query("select p from Order p where p.orderDate between :fromDate and :toDate")
	List<Order> searchByFromDateAndToDate(@Param("fromDate") Date fromDate, @Param("toDate") Date toDate);

	@Query("select p from Order as p where p.orderDate =:Date and p.hour =:Hour and p.minute =:Minute")
	List<Order> searchByDateAndTime(@Param("Date") Date Date, @Param("Hour") int Hour, @Param("Minute") int Minute);

	@Query("select p from Order p where p.hour between :fromHour and :toHour and p.minute between :fromMinute and :toMinute ")
	List<Order> searchByHoursAndMinute(@Param("fromHour") int fromHour, @Param("fromMinute") int fromMinute,
			@Param("toHour") int toHour, @Param("toMinute") int toMinute);

	@Query("select p from Order p where p.orderDate between :fromDate and :toDate and p.hour between :fromHour and :toHour and p.minute between :fromMinute and :toMinute")
	List<Order> searchByDatesAndTime(@Param("fromDate") Date fromDate, @Param("fromHour") int fromHour,
			@Param("fromMinute") int fromMinute, @Param("toDate") Date toDate, @Param("toHour") int toHour,
			@Param("toMinute") int toMinute);

	@Query("select o from Order as o join o.customer as c where c.lastName like %:name% or c.firstName like %:name% ")
	List<Order> searchOrderByFirstnameAndLastname(@Param("name") String name);

}
