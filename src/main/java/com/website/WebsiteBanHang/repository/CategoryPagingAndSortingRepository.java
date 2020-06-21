package com.website.WebsiteBanHang.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.Category;

@Repository
public interface CategoryPagingAndSortingRepository extends PagingAndSortingRepository<Category, Long> {

}
