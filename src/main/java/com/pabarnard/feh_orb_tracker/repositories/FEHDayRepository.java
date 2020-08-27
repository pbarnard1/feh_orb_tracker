package com.pabarnard.feh_orb_tracker.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.pabarnard.feh_orb_tracker.models.FEHDay;

@Repository
public interface FEHDayRepository extends CrudRepository<FEHDay, Long> {
	// Get all days
	List<FEHDay> findAll();
	
	// Get between two dates - includes first day and excludes last day
	List<FEHDay> findByOrbDateGreaterThanEqualAndOrbDateLessThan(Date date1, Date date2);
	
	// Get earliest and latest day - MUST include name of schema below; variables in table MUST MATCH (orb_date, NOT orbDate)
	@Query(value="SELECT * FROM feh_orb_tracker_schema.fehdays ORDER BY orb_date DESC LIMIT 1", nativeQuery = true)
	FEHDay findNewestDay();
	
	@Query(value="SELECT * FROM feh_orb_tracker_schema.fehdays ORDER BY orb_date ASC LIMIT 1", nativeQuery = true)
	FEHDay findEarliestDay();
	
}
