package com.website.WebsiteBanHang.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

	@Query("select  p from Product as p join p.categories as c where c.categoryCode = :categoryId")
	List<Product> findByCategory(@Param("categoryId") Long categoryId);

	@Query("select sp from Product sp")
	List<Product> getAll();

	@Query("select p from Product p where p.productName like %:productName%")
	List<Product> getFindProduct(@Param("productName") String productName);

	@Query("select sp from Product sp")
	List<Product> getAllByProduct(Pageable pageable);

}
