package com.naretto.gamestore.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.naretto.gamestore.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	Optional<User> findByAdresseMail(String adresseMail);

}
