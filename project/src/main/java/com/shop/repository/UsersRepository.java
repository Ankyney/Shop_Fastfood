package com.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shop.entities.Users;

public interface UsersRepository extends JpaRepository<Users, Long> {

}
