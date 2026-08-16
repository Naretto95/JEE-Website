package com.naretto.gamestore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naretto.gamestore.model.Commande;
import com.naretto.gamestore.model.User;
import com.naretto.gamestore.repository.CommandeRepository;

@Service
public class CommandeService {

	private final CommandeRepository commandeRepository;

	@Autowired
	public CommandeService(CommandeRepository commandeRepository) {
		this.commandeRepository = commandeRepository;
	}

	public Commande findById(int id) {
		return commandeRepository.findById(id).orElse(null);
	}

	public List<Commande> findAll() {
		return commandeRepository.findAll();
	}

	public List<Commande> findByUser(User user) {
		if (user == null) {
			return null;
		}
		return commandeRepository.findByUser(user);
	}

	@Transactional
	public Commande create(User user) {
		if (user == null) {
			return null;
		}
		Commande commande = new Commande();
		commande.setUser(user);
		return commandeRepository.save(commande);
	}

	@Transactional
	public Commande save(Commande commande) {
		return commandeRepository.save(commande);
	}

}
