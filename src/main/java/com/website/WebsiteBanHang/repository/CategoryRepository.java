package com.website.WebsiteBanHang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
	@Query("select dm from Category dm")
	List<Category> getAll();

	@Query("select dm from Category dm where dm.categoryName like %:categoryName%")
	List<Category> getFindCategory(@Param("categoryName") String categoryName);

	@Query("select distinct c from Category as c where c.categoryName = :categoryName")
	Category findByCategoryName(@Param("categoryName") String categoryName);
}
