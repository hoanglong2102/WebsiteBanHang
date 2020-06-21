package com.website.WebsiteBanHang.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.website.WebsiteBanHang.entities.Category;

public interface CategoryService {

	public Category getCategory(Long id);

	public List<Category> getAll();

	public String add(Category category);

	public String update(Category category);

	public void delete(Category category);

	public void delete(Long id);

	public void createDefaultCategory() throws Exception;

	public List<Category> getFindCategory(String categoryName);

	public Page<Category> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy);
}
