package com.pabarnard.feh_orb_tracker.controllers;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pabarnard.feh_orb_tracker.models.FEHDay;
import com.pabarnard.feh_orb_tracker.models.User;
import com.pabarnard.feh_orb_tracker.services.BonusOrbService;
import com.pabarnard.feh_orb_tracker.services.FEHDayService;
import com.pabarnard.feh_orb_tracker.services.UserService;

@Controller
public class MainController {
	private final UserService userService;
	private final FEHDayService fehDayService;
	private final BonusOrbService bonusOrbService;
	
	public MainController(UserService userService, FEHDayService fehDayService, BonusOrbService bonusOrbService) {
		this.userService = userService;
		this.fehDayService = fehDayService;
		this.bonusOrbService = bonusOrbService;
	}
    
	@GetMapping("/load")
	public String loadData(HttpSession session) {
		Long myId = (Long) session.getAttribute("userId");
    	if (myId == null) { // If no session is active - i.e. nobody is logged in
    		return "redirect:/"; // Send back to log-in page if nobody found in session
    	}
    	/* Load other stuff into session for use in all pages other than log-in/registration
    	 * User ID already loaded
    	 */
    	
    	/* Get current month */
    	LocalDate currentDay = LocalDate.now(); // Start with today
    	// Get date corresponding to first day of month
    	LocalDate firstDayOfMonth = LocalDate.of(currentDay.getYear(), currentDay.getMonthValue(), 1);
    	session.setAttribute("firstDayOfMonth", firstDayOfMonth);
    	/* Add other session variables here. */
    	return "redirect:/main"; // Go to main page
	}
	
	@GetMapping("/main")
	public String mainPage(HttpSession session, Model model, @ModelAttribute("user") User user) {
		Long myId = (Long) session.getAttribute("userId");
    	if (myId == null) { // If no session is active - i.e. nobody is logged in
    		return "redirect:/"; // Send back to log-in page if nobody found in session
    	}
    	// Use session to figure out what month is currently being viewed - if nothing stored,
    	// set shown month to be the current month
    	
    	/*
    	 * TO DO:
    	 * 1. If possible: add color for current day - only if time permits.
    	 * 2. Ensure user name is unique.
    	 * 3. Add database with banners and allow one to get the number of orbs during that banner.
    	 *    Also for future banners, add number of orbs before start of banner as well.
    	 * 4. Add database for future orbs for each month.
    	 * 5. Automatically add orbs based on things like log-in bonuses, new/special heroes banners, Voting Gauntlet, etc.  Allow custom amounts
    	 *    (e.g. instead of 2/day or 1/1/1/1/2/1/1/1/1/3, maybe something like 1/2/3/4/5).
    	 * 6. Limit it so that only I can edit banners and add months and edit orbs.
    	 * 7. Look at Spring Security to help with this.
    	 * 8. Make mobile friendly - add calendar view and simple view.
    	 */
		User myUser = userService.findUserById(myId); // Get user
		model.addAttribute("user", myUser);
		// Get days for current month
		LocalDate firstDay = (LocalDate) session.getAttribute("firstDayOfMonth");
		LocalDate lastDay = firstDay.plusMonths(1);
		ZoneId defaultZoneId = ZoneId.systemDefault();
		Date formattedFirstDay = Date.from(firstDay.atStartOfDay(defaultZoneId).toInstant());
		Date formattedLastDay = Date.from(lastDay.atStartOfDay(defaultZoneId).toInstant());
		List<FEHDay> foundDays = fehDayService.findDays(formattedFirstDay, formattedLastDay);
		if (foundDays.size() == 0) { // If database is empty
			LocalDate thisDate = LocalDate.now(); // Get today's date
			LocalDate startOfThisMonth = LocalDate.of(thisDate.getYear(), thisDate.getMonthValue(), 1);
		    addNewMonth(startOfThisMonth); // Start database with this month
		    foundDays = fehDayService.findDays(formattedFirstDay, formattedLastDay);
		}
		model.addAttribute("days", foundDays);
		// Get earliest and latest days
		FEHDay earliestDay = fehDayService.findEarliestDay();
		FEHDay newestDay = fehDayService.findNewestDay();
		model.addAttribute("earliestDay",earliestDay);
		model.addAttribute("newestDay",newestDay);
		// Show months in terms of text for navigating
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM YYYY");
		if (!foundDays.contains(earliestDay)) {
			LocalDate startOfPrevMonth = firstDay.minusMonths(1);
			model.addAttribute("prevMonth",startOfPrevMonth.format(dateFormatter));
		}
		if (!foundDays.contains(newestDay)) {
			LocalDate startOfNextMonth = firstDay.plusMonths(1);
			model.addAttribute("nextMonth",startOfNextMonth.format(dateFormatter));
		}
		DateTimeFormatter fullMonthFormatter = DateTimeFormatter.ofPattern("MMMM YYYY");
		model.addAttribute("thisMonth",firstDay.format(fullMonthFormatter));
		// For orb form
		model.addAttribute("totalOrbs",session.getAttribute("totalOrbs"));
		model.addAttribute("startingDate",session.getAttribute("startingDate"));
		model.addAttribute("endingDate",session.getAttribute("endingDate"));
		return "main_page.jsp";
	}
	
	@PostMapping("/calculate_orbs")
	public String calculateOrbs(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			RedirectAttributes redirectAttributes, HttpSession session) {
		LocalDate newStart = LocalDate.parse(startDate);
		LocalDate newEnd = LocalDate.parse(endDate);
		if (newStart.isAfter(newEnd)) {
			redirectAttributes.addFlashAttribute("dateError", "Start date must be before end date");
			return "redirect:/main"; 
		}
		if (newStart.equals(newEnd)) {
			redirectAttributes.addFlashAttribute("dateError", "Start date and end date must be different");
			return "redirect:/main";
		}
		ZoneId defaultZoneId = ZoneId.systemDefault(); 
		newEnd = newEnd.plusDays(1); // Last day EXCLUDED when we find days with fehDayService, so we must add 1 here
	    //local date + atStartOfDay() + default time zone + toInstant() = Date
	    Date formattedFirstDay = Date.from(newStart.atStartOfDay(defaultZoneId).toInstant());
	    Date formattedLastDay = Date.from(newEnd.atStartOfDay(defaultZoneId).toInstant());
	    List<FEHDay> foundDays = fehDayService.findDays(formattedFirstDay, formattedLastDay);
	    // Get total number of orbs between the two dates
	    int totalOrbs = 0;
	    for (FEHDay fDay: foundDays) {
	    	totalOrbs += fDay.getTotalOrbs();
	    }
	    session.setAttribute("totalOrbs", totalOrbs);
	    session.setAttribute("startingDate",startDate);
	    session.setAttribute("endingDate",endDate);
	    redirectAttributes.addFlashAttribute("preload","preload"); // To allow modal to load
		return "redirect:/main";
	}
	
	@PutMapping("/edit_orb_count")
	public String editOrbCount(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			System.out.println("Errors found");
			redirectAttributes.addFlashAttribute("orbError","Value must be an integer");
			return "redirect:/main";
		}
		int orbCount = user.getOrbBalance(); // Get value from form
		Long myId = (Long) session.getAttribute("userId");
		User myUser = userService.findUserById(myId); // Get user
		myUser.setOrbBalance(orbCount); // Update orb balance
		userService.updateUser(myUser); // Save updated user
		return "redirect:/main";
	}
	
	@GetMapping("/prev_month")
	public String previousMonth(HttpSession session) {
		Long myId = (Long) session.getAttribute("userId");
    	if (myId == null) { // If no session is active - i.e. nobody is logged in
    		return "redirect:/"; // Send back to log-in page if nobody found in session
    	}
    	LocalDate firstDay = (LocalDate) session.getAttribute("firstDayOfMonth");
		LocalDate newFirstDay = firstDay.minusMonths(1); // Get first day of previous month
		session.setAttribute("firstDayOfMonth", newFirstDay);
		return "redirect:/main";
	}
	
	@GetMapping("/next_month")
	public String nextMonth(HttpSession session) {
		Long myId = (Long) session.getAttribute("userId");
    	if (myId == null) { // If no session is active - i.e. nobody is logged in
    		return "redirect:/"; // Send back to log-in page if nobody found in session
    	}
    	LocalDate firstDay = (LocalDate) session.getAttribute("firstDayOfMonth");
		LocalDate newFirstDay = firstDay.plusMonths(1); // Get first day of next month
		session.setAttribute("firstDayOfMonth", newFirstDay);
		return "redirect:/main";
	}
	
	@GetMapping("/add_oldest_month")
	public String addOldestMonth(HttpSession session) {
		Long myId = (Long) session.getAttribute("userId");
    	if (myId == null) { // If no session is active - i.e. nobody is logged in
    		return "redirect:/"; // Send back to log-in page if nobody found in session
    	}
    	FEHDay earliestDay = fehDayService.findEarliestDay();
    	ZoneId defaultZoneId = ZoneId.systemDefault(); 
    	LocalDate firstDay = earliestDay.getOrbDate().toInstant().atZone(defaultZoneId).toLocalDate();
    	LocalDate newFirstDay = firstDay.minusMonths(1);
    	addNewMonth(newFirstDay);
    	session.setAttribute("firstDayOfMonth", newFirstDay); // Show new month
		return "redirect:/main";
	}
	
	@GetMapping("/add_newest_month")
	public String addNewestMonth(HttpSession session) {
		Long myId = (Long) session.getAttribute("userId");
    	if (myId == null) { // If no session is active - i.e. nobody is logged in
    		return "redirect:/"; // Send back to log-in page if nobody found in session
    	}
    	// Get object of newest day
    	FEHDay newestDay = fehDayService.findNewestDay();
    	ZoneId defaultZoneId = ZoneId.systemDefault();
    	LocalDate localNewestDay = newestDay.getOrbDate().toInstant().atZone(defaultZoneId).toLocalDate();
    	// Get day at start of month
    	LocalDate startOfThisMonth = LocalDate.of(localNewestDay.getYear(), localNewestDay.getMonthValue(), 1);
    	// Get day at start of next month - the new month to be added
    	LocalDate newFirstDay = startOfThisMonth.plusMonths(1);
    	addNewMonth(newFirstDay);
    	session.setAttribute("firstDayOfMonth", newFirstDay); // Show new month
		return "redirect:/main";
	}
	
	@GetMapping("/days/{day_id}/edit")
	public String viewEditDayPage(@PathVariable("day_id") String day_id, Model model, HttpSession session,
			@ModelAttribute("fehDay") FEHDay fehDay) {
		Long myId = (Long) session.getAttribute("userId");
    	if (myId == null) { // If no session is active - i.e. nobody is logged in
    		return "redirect:/"; // Send back to log-in page if nobody found in session
    	}
    	// Find user object
    	User myUser = userService.findUserById(myId);
    	model.addAttribute("user",myUser);
    	// Find FEHDay object
		Long dayId = Long.parseLong(day_id);
		FEHDay myDay = fehDayService.readDay(dayId);
		model.addAttribute("fehDay", myDay); // MUST have name match the model attribute to pre-populate form
		// If no day, go back to main page
		if (myDay == null) {
			return "redirect:/main";
		}
		return "edit_day.jsp";
	}
	
	@PutMapping("/days/{day_id}/edit")
	public String editDay(@Valid @ModelAttribute("fehDay") FEHDay fehDay, BindingResult result, 
			@PathVariable("day_id") String day_id, HttpSession session, Model model) {
		// Find user object
    	Long myId = (Long) session.getAttribute("userId");
    	User myUser = userService.findUserById(myId);
    	model.addAttribute("user",myUser);
		if (result.hasErrors()) {
			Long dayId = Long.parseLong(day_id);
			FEHDay myDay = fehDayService.readDay(dayId);
			model.addAttribute("fehDay", myDay); // MUST have name match the model attribute to pre-populate form
			System.out.println("Errors found");
        	model.addAttribute("errorMessage", "Unable to edit day");
            return "edit_day.jsp";
        } else {
        	System.out.println("No errors found");
        	// Make sure other parameters NOT set/changed in form are here as well - this INCLUDES the ID!
        	Long dayId = Long.parseLong(day_id);
    		fehDay.setId(dayId);
    		// Get saved date and make sure it's added
    		Date savedDate = fehDayService.readDay(dayId).getOrbDate();
    		fehDay.setOrbDate(savedDate);
    		// Update day orb sum
    		fehDay = fehDayService.updateSum(fehDay);
            //fehDayService.updateDay(fehDay); // DON'T NEED since updateSum automatically saves
            return "redirect:/main";
        }
	}
	
	// Method to add a month to the database
	public void addNewMonth(LocalDate firstDayOfMonth) {
    	LocalDate startOfNextMonth = firstDayOfMonth.plusMonths(1);
    	LocalDate currentDayOfMonth = LocalDate.of(firstDayOfMonth.getYear(), firstDayOfMonth.getMonthValue(), firstDayOfMonth.getDayOfMonth());
		ZoneId defaultZoneId = ZoneId.systemDefault(); // Get default time zone
		int totalOrbs; // Number of orbs for that day
		// FEH launched Thursday, February 2, 2017, so we'll treat Tuesday, 1/24/2017, as start of season 0 and 1/31/2017 as start of season 1
		LocalDate startOfSeasonZero = LocalDate.of(2017, Month.JANUARY, 24);
		long seasonNumber; // Season number
		// Loop to add days to database
    	while (currentDayOfMonth.isBefore(startOfNextMonth)) {
    		// Create new day
    		//local date + atStartOfDay() + default time zone + toInstant() = Date
    	    Date formattedDate = Date.from(currentDayOfMonth.atStartOfDay(defaultZoneId).toInstant());
    		FEHDay newDay = new FEHDay(formattedDate);
    		// Add logic for adding orbs here BEFORE saving
    		DayOfWeek dayOfWeek = currentDayOfMonth.getDayOfWeek();
    		
    		switch (dayOfWeek) {
    			case MONDAY:
    				newDay.setArenaOrbs(4);
    			    seasonNumber = ChronoUnit.WEEKS.between(startOfSeasonZero, currentDayOfMonth);
    				newDay.setArenaDesc("Arena orb rewards for end of season "+Long.toString(seasonNumber));
    				totalOrbs = newDay.getTotalOrbs();
    				totalOrbs += 4;
    				newDay.setTotalOrbs(totalOrbs);
    				break;
    			case TUESDAY:
    				seasonNumber = ChronoUnit.WEEKS.between(startOfSeasonZero, currentDayOfMonth);
    				if (seasonNumber >= 68) { // Arena streak orb added starting season 67 (May 9 [Wednesday instead of Tuesday] - May 14, 2018)
    					newDay.setArenaOrbs(1);
        				newDay.setArenaDesc("4-match streak for season "+Long.toString(seasonNumber));
        				totalOrbs = newDay.getTotalOrbs();
        				totalOrbs += 1;
        				newDay.setTotalOrbs(totalOrbs);
    				}
    				break;
				case WEDNESDAY:
					seasonNumber = ChronoUnit.WEEKS.between(startOfSeasonZero, currentDayOfMonth);
					// SPECIAL CASE: season 67 only started on Wednesday
					if (seasonNumber == 67) { // Arena streak orb added starting season 67 (May 9 [Wednesday instead of Tuesday] - May 14, 2018)
    					newDay.setArenaOrbs(1);
        				newDay.setArenaDesc("4-match streak for season "+Long.toString(seasonNumber));
        				totalOrbs = newDay.getTotalOrbs();
        				totalOrbs += 1;
        				newDay.setTotalOrbs(totalOrbs);
    				}
					break;
				case THURSDAY:
					
					break;
				case FRIDAY:
					
					break;
				case SATURDAY:
					newDay.setRivalDomainsOrbs(1);
					newDay.setRivalDomainsDesc("Rival Domains orb for season");
					newDay.setQuestOrbs(1);
					newDay.setQuestDesc("Defeat 20 enemies");
					totalOrbs = newDay.getTotalOrbs();
    				totalOrbs += newDay.getRivalDomainsOrbs();
    				totalOrbs += newDay.getQuestOrbs();
    				newDay.setTotalOrbs(totalOrbs);
					break;
				case SUNDAY:
					newDay.setLoginBonusOrbs(1);
					newDay.setLoginBonusDesc("Sunday log-in bonus");
					newDay.setQuestOrbs(1);
					newDay.setQuestDesc("Defeat 20 enemies");
					totalOrbs = newDay.getTotalOrbs();
    				totalOrbs += newDay.getLoginBonusOrbs();
    				totalOrbs += newDay.getQuestOrbs();
    				newDay.setTotalOrbs(totalOrbs);
					break;
    		}
    		// Save the new day
    		fehDayService.createDay(newDay);
    		// Increment day
    		currentDayOfMonth = currentDayOfMonth.plusDays(1);
    	}
	}
}