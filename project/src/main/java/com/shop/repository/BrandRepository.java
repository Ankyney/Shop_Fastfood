package com.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.entities.Brand;

public interface BrandRepository extends JpaRepository<Brand, Long> {

}
