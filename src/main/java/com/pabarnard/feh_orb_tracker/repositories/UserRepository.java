package com.pabarnard.feh_orb_tracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pabarnard.feh_orb_tracker.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	// Find user by their e-mail
	User findByEmail(String email);
	// Get all users
	List<User> findAll();
}
