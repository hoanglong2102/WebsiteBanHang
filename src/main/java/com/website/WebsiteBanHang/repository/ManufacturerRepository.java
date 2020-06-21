package com.website.WebsiteBanHang.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.website.WebsiteBanHang.entities.Manufacturer;

@Repository
public interface ManufacturerRepository extends JpaRepository<Manufacturer, Long> {

	@Query("select nsx from Manufacturer as nsx where nsx.manufacturerName like %:manufacturerName%")
	List<Manufacturer> getFindManufacturer(@Param("manufacturerName") String manufacturerName);

	@Query("select distinct m from Manufacturer as m where m.manufacturerName = :manufacturerName")
	Manufacturer findByManufacturerName(@Param("manufacturerName") String manufacturerName);
}
