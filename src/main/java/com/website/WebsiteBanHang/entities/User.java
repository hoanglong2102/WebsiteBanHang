package com.website.WebsiteBanHang.entities;

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
@Table(name = "user", schema = "websitebanhang")

public class User implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Long id;
	private String userName;
	private String password;
	private String email;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	private Boolean isActive = false;
	private UserType userType;
	private String profileImage;
	private MultipartFile profileImageFile = null;

	/* private List<Permission> permissions; */

	private List<Long> userTypeId;
	private List<UserType> userTypes;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_ID", unique = true, nullable = false)
	public Long getId() {

		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "USER_NAME", length = 20)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "PASSWORD", length = 256)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "EMAIL", length = 128)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "PHONE_NUMBER", length = 20)
	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "FIRST_NAME", length = 20)
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "LAST_NAME", length = 20)
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@ManyToOne
	@JoinColumn(name = "USER_TYPE_ID", nullable = false)
	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;

	}

	@Column(name = "IS_ACTIVE", length = 1)
	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	@Transient
	public MultipartFile getProfileImageFile() {
		return profileImageFile;
	}

	public void setProfileImageFile(MultipartFile profileImageFile) {
		this.profileImageFile = profileImageFile;
	}

	@Column(name = "IMAGE_NAME", length = 255, nullable = true)
	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	@Transient
	public List<Long> getUserTypeId() {
		return userTypeId;
	}

	public void setUserTypeId(List<Long> userTypeId) {
		this.userTypeId = userTypeId;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "USER_USERTYPE", joinColumns = { @JoinColumn(name = "USER_ID") }, inverseJoinColumns = {
			@JoinColumn(name = "USER_TYPE_ID") })
	public List<UserType> getUserTypes() {
		return userTypes;
	}

	public void setUserTypes(List<UserType> userTypes) {
		this.userTypes = userTypes;
	}

}
