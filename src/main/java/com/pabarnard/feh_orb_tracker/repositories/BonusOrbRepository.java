package com.pabarnard.feh_orb_tracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.pabarnard.feh_orb_tracker.models.BonusOrb;

public interface BonusOrbRepository extends CrudRepository<BonusOrb, Long> {
	// Get all bonus orbs for ALL users
	List<BonusOrb> findAll();
}
