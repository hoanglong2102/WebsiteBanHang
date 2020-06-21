package com.website.WebsiteBanHang.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category", schema = "websitebanhang")
public class Category implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long categoryCode;
	private String categoryName;
	private String categoryImages;

	private List<Product> products;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CATEGORY_CODE", unique = true, nullable = false)
	public Long getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(Long categoryCode) {
		this.categoryCode = categoryCode;
	}

	@Column(name = "CATEGORY_NAME", length = 128)
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Column(name = "CATEGORY_IMAGES", length = 50)
	public String getCategoryImages() {
		return categoryImages;
	}

	public void setCategoryImages(String categoryImages) {
		this.categoryImages = categoryImages;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "PRODUCT_CATEGORY", joinColumns = { @JoinColumn(name = "PRODUCT_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "CATEGORY_ID") })
	public List<Product> getProduct() {
		return products;
	}

	public void setProduct(List<Product> products) {
		this.products = products;
	}

}
