package com.website.WebsiteBanHang.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.Product;

@Repository
public interface ProductPagingAndSortingRepository extends PagingAndSortingRepository<Product, Long> {

	@Query("select  p from Product as p join p.categories as c where c.categoryCode = :filter")
	Page<Product> findAllWithFilter(Long filter, Pageable pageable);

	@Query("select  p from Product as p join p.manufacturer as c where c.id = :filter")
	Page<Product> findAllWithFilterManufacturer(Long filter, Pageable pageable);
}
