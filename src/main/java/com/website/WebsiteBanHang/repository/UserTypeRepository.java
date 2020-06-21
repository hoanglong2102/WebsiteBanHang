package com.website.WebsiteBanHang.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.UserType;

@Repository
public interface UserTypeRepository extends JpaRepository<UserType, Long>{

}