package com.website.WebsiteBanHang.entities;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "product", schema = "websitebanhang")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long productCode;
	private String productName;
	private Integer oldPrice;
	private Double discount;
	private String productImages;
	private Date created;
	private Integer newPrice;
	private Integer yearManufactured;
	private Integer productNumber;
	private Integer remain;

	private Manufacturer manufacturer;

	private String description;
	private List<Long> categoryIds;

	private List<Category> categories;

	private MultipartFile imageFile = null;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PRODUCT_CODE", unique = true, nullable = false)
	public Long getProductCode() {
		return productCode;
	}

	public void setProductCode(Long productCode) {
		this.productCode = productCode;
	}

	@Column(name = "PRODUCT_NAME")
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Column(name = "OLD_PRICE", nullable = true)
	public Integer getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(Integer oldPrice) {
		this.oldPrice = oldPrice;
	}

	@Transient
	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	@Column(name = "IMAGE", length = 128, nullable = true)

	public String getProductImages() {
		return productImages;
	}

	public void setProductImages(String productImages) {
		this.productImages = productImages;
	}

	@Column(name = "DESCRIPTION", length = 1200)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "CREATED", nullable = true)
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	@Column(name = "DISCOUNT", nullable = true)
	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	@Column(name = "YEAR_MANUFACTURED", length = 3, nullable = true)
	public Integer getYearManufactured() {
		return yearManufactured;
	}

	public void setYearManufactured(Integer yearManufactured) {
		this.yearManufactured = yearManufactured;
	}

	@Column(name = "PRODUCT_NUMBER", nullable = true)
	public Integer getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Integer productNumber) {
		this.productNumber = productNumber;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "PRODUCT_CATEGORY", joinColumns = { @JoinColumn(name = "PRODUCT_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "CATEGORY_ID") })
	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	@Transient
	public List<Long> getCategoryIds() {
		return categoryIds;
	}

	public void setCategoryIds(List<Long> categoryIds) {
		this.categoryIds = categoryIds;
	}

	@Transient
	public Integer getNewPrice() {
		return (int) (getOldPrice() * ((100 - this.discount) / 100));
	}

	public void setNewPrice(Integer newPrice) {
		this.newPrice = newPrice;
	}

	@Column(name = "REMAIN", nullable = true)
	public Integer getRemain() {
		return remain;
	}

	public void setRemain(Integer remain) {
		this.remain = remain;
	}

	@ManyToOne
	@JoinColumn(name = "MANUFACTURER_ID", nullable = true)
	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}

}
