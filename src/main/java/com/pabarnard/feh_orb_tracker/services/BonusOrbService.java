package com.pabarnard.feh_orb_tracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pabarnard.feh_orb_tracker.models.BonusOrb;
import com.pabarnard.feh_orb_tracker.repositories.BonusOrbRepository;

@Service
public class BonusOrbService {
	private final BonusOrbRepository bonusOrbRepository;
	
	public BonusOrbService(BonusOrbRepository BonusOrbRepository) {
		this.bonusOrbRepository = BonusOrbRepository;
	}
	
	// Retrieve all Orbs
	public List<BonusOrb> allOrbs() {
		return bonusOrbRepository.findAll();
	}
	
	// Create a bonus orb
	public BonusOrb createOrb(BonusOrb myOrb) {
		return bonusOrbRepository.save(myOrb); // Create new record with this Orb
	}
	
	// Read a bonus orb
	public BonusOrb readOrb(Long id) {
		// Find Orb, if possible
		Optional<BonusOrb> optionalOrb = bonusOrbRepository.findById(id);
        if(optionalOrb.isPresent()) { // If not null
            return optionalOrb.get(); // Return found Orb
        } else {
            return null;
        }
	}
	
	// Update a bonus orb
	public BonusOrb updateOrb(BonusOrb myOrb) {
		return bonusOrbRepository.save(myOrb);
	}
	
	// Delete a bonus orb
	public void deleteOrb(Long id) {
		if (bonusOrbRepository.existsById(id)) { // If Orb with id exists
			bonusOrbRepository.deleteById(id); // Delete it
		} // If not, do nothing
	}
}
