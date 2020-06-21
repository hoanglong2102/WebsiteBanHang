package com.website.WebsiteBanHang.model;

import com.website.WebsiteBanHang.entities.Product;

public class ProductInfo {
	private Long id;
	private String productName;
	private Integer newPrice;
	private int oldPrice;
	private String productImages;
	private Double discount;
	private Integer yearManufactured;
	private Integer productNumber;

	public ProductInfo() {

	}

	public ProductInfo(Product product) {
		this.id = product.getProductCode();
		this.productName = product.getProductName();
		this.oldPrice = product.getOldPrice();
		this.newPrice = product.getNewPrice();
		this.discount = product.getDiscount();
		this.productImages = product.getProductImages();
		this.productNumber = product.getProductNumber();
		this.yearManufactured = product.getYearManufactured();
	}

	public ProductInfo(Long id, String productName, int oldPrice, String productImages, Integer newPrice,
			Double discount, Integer yearManufactured, Integer productNumber) {

		this.id = id;
		this.productName = productName;
		this.oldPrice = oldPrice;
		this.newPrice = newPrice;
		this.productImages = productImages;
		this.discount = discount;
		this.productNumber = productNumber;
		this.yearManufactured = yearManufactured;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(int oldPrice) {
		this.oldPrice = oldPrice;
	}

	public String getProductImages() {
		return productImages;
	}

	public void setProductImages(String productImages) {
		this.productImages = productImages;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Integer getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(Integer newPrice) {
		this.newPrice = newPrice;
	}

	public Integer getYearManufactured() {
		return yearManufactured;
	}

	public void setYearManufactured(Integer yearManufactured) {
		this.yearManufactured = yearManufactured;
	}

	public Integer getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Integer productNumber) {
		this.productNumber = productNumber;
	}

}
