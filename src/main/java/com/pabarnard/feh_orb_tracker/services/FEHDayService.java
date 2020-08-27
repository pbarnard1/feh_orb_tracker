package com.pabarnard.feh_orb_tracker.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pabarnard.feh_orb_tracker.models.FEHDay;
import com.pabarnard.feh_orb_tracker.repositories.FEHDayRepository;

@Service
public class FEHDayService {
	private final FEHDayRepository fehDayRepository;
	
	public FEHDayService(FEHDayRepository FEHDayRepository) {
		this.fehDayRepository = FEHDayRepository;
	}
	
	// Retrieve all Days
	public List<FEHDay> allDays() {
		return fehDayRepository.findAll();
	}
	
	public List<FEHDay> findDays(Date date1, Date date2) {
		return fehDayRepository.findByOrbDateGreaterThanEqualAndOrbDateLessThan(date1, date2);
	}
	
	public FEHDay findEarliestDay() {
		return fehDayRepository.findEarliestDay();
	}
	
	public FEHDay findNewestDay() {
		return fehDayRepository.findNewestDay();
	}
	
	// Create a Day
	public FEHDay createDay(FEHDay myDay) {
		return fehDayRepository.save(myDay); // Create new record with this Day
	}
	
	// Read a Day
	public FEHDay readDay(Long id) {
		// Find Day, if possible
		Optional<FEHDay> optionalDay = fehDayRepository.findById(id);
        if(optionalDay.isPresent()) { // If not null
            return optionalDay.get(); // Return found Day
        } else {
            return null;
        }
	}
	
	// Update sum
	
	public FEHDay updateSum(FEHDay myDay) {
		if (myDay != null) {
			// Go through each field
			int cumSum = 0;
			// Get values of each field and add on
		    cumSum += myDay.getStoryParalogueOrbs();
		    cumSum += myDay.getChainChallengeOrbs();
		    cumSum += myDay.getSquadAssaultOrbs();
		    cumSum += myDay.getArenaOrbs();
		    cumSum += myDay.getRivalDomainsOrbs();
		    cumSum += myDay.getHeroBattleOrbs();
		    cumSum += myDay.getTacticsDrillOrbs();
		    cumSum += myDay.getAllegianceBattleOrbs();
		    cumSum += myDay.getTempestTrialsOrbs();
		    cumSum += myDay.getTapBattleOrbs();
		    cumSum += myDay.getGrandConquestRokkrSiegesOrbs();
		    cumSum += myDay.getForgingBondsHallOfFormsOrbs();
		    cumSum += myDay.getLostLoreOrbs();
		    cumSum += myDay.getQuestOrbs();
		    cumSum += myDay.getLoginBonusOrbs();
		    cumSum += myDay.getEventOrbs();
		    cumSum += myDay.getCompensationOrbs();
		    // 
		    myDay.setTotalOrbs(cumSum);
		    myDay = updateDay(myDay); // Save this day
		}
		return myDay;
	}
	
	public FEHDay updateSum(Long id) {
		FEHDay thisDay = readDay(id);
		if (thisDay != null) {
			thisDay = updateSum(thisDay);
		}
		return thisDay;
	}
	
	// Update a Day
	public FEHDay updateDay(FEHDay myDay) {
		return fehDayRepository.save(myDay);
	}
	
	// Delete a Day
	public void deleteDay(Long id) {
		if (fehDayRepository.existsById(id)) { // If Day with id exists
			fehDayRepository.deleteById(id); // Delete it
		} // If not, do nothing
	}
}
