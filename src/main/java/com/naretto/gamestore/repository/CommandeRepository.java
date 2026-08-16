package com.naretto.gamestore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.naretto.gamestore.model.Commande;
import com.naretto.gamestore.model.User;

public interface CommandeRepository extends JpaRepository<Commande, Integer> {

	List<Commande> findByUser(User user);

}
