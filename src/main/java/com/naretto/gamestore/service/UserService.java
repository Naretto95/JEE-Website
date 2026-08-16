package com.naretto.gamestore.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.naretto.gamestore.model.User;
import com.naretto.gamestore.repository.UserRepository;

@Service
public class UserService {

	private final UserRepository userRepository;
	private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Autowired
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	public User findById(int id) {
		return userRepository.findById(id).orElse(null);
	}

	/**
	 * Looks up a user by e-mail and checks the raw password against the stored hash.
	 *
	 * @return the matching user, or {@code null} if the credentials are invalid
	 */
	public User authenticate(String email, String rawPassword) {
		if (email == null || rawPassword == null) {
			return null;
		}
		Optional<User> user = userRepository.findByAdresseMail(email);
		if (user.isPresent() && passwordEncoder.matches(rawPassword, user.get().getMdp())) {
			return user.get();
		}
		return null;
	}

	@Transactional
	public User register(User user) {
		user.setMdp(passwordEncoder.encode(user.getMdp()));
		return userRepository.save(user);
	}

	/**
	 * Changes a user's password after verifying the current one.
	 *
	 * @return {@code true} if the password was changed
	 */
	@Transactional
	public boolean changePassword(User user, String oldPassword, String newPassword, String newPasswordConfirmation) {
		if (user == null || oldPassword == null || !passwordEncoder.matches(oldPassword, user.getMdp())) {
			return false;
		}
		if (newPassword == null || !newPassword.equals(newPasswordConfirmation)) {
			return false;
		}
		user.setMdp(passwordEncoder.encode(newPassword));
		userRepository.save(user);
		return true;
	}

}
