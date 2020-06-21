
package com.website.WebsiteBanHang.entities;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "orders", schema = "websitebanhang")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", length = 50)
	private Long id;

	@Column(name = "ORDER_DATE", nullable = true)
	private Date orderDate;

	@Column(name = "ORDER_NUM", nullable = false)
	private int orderNum;

	@Column(name = "HOUR", nullable = false)
	private int hour;

	@Column(name = "MINUTE", nullable = false)
	private int minute;

	@Column(name = "Amount", nullable = false)
	private double amount;

	@Column(name = "TOTAL_QUANITY", nullable = false)
	private int totalQuanity;
	@ManyToOne
	@JoinColumn(name = "CUSTOMER_ID", nullable = false)
	private Customer customer;

	@Column(name = "STATUS", nullable = true)
	private int status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getMinute() {
		return minute;
	}

	public void setMinute(int minute) {
		this.minute = minute;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getTotalQuanity() {
		return totalQuanity;
	}

	public void setTotalQuanity(int totalQuanity) {
		this.totalQuanity = totalQuanity;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
