package com.website.WebsiteBanHang.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.User;

@Repository
public interface UserPagingAndSortingRepository extends PagingAndSortingRepository<User, Long> {

}
