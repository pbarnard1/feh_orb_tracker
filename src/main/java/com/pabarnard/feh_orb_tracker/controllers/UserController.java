package com.pabarnard.feh_orb_tracker.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pabarnard.feh_orb_tracker.models.User;
import com.pabarnard.feh_orb_tracker.services.UserService;
import com.pabarnard.feh_orb_tracker.validators.UserValidator;

/* REMEMBER TO:
1. Reimport. (Ctrl+Shift+letter "O")
2. Change name of routes jsp pages below as needed.
3. Add new controllers for the actual content of your sites.
*/

@Controller
public class UserController {
	private final UserService userService;
	private final UserValidator userValidator; // NEW
    
    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator; // NEW
    }
    
    // Log-in and registration page
    @GetMapping("/")
    public String index(@ModelAttribute("user") User user, HttpSession session) {
    	Long myId = (Long) session.getAttribute("userId");
    	if (myId != null) {
    		return "redirect:/main"; // Send to main page - already logged in
    	} else {
    		return "login_registration.jsp";
    	}
    }
    
    @PostMapping(value="/registration")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session,
    		RedirectAttributes redirectAttributes, Model model) {
        userValidator.validate(user, result); // Validate with custom validations now
        userValidator.validateEmail(user, result, userService); // Validate with custom validations now
        if(result.hasErrors()) {
        	// The lines below are added by me except for the return part
        	System.out.println(result.getAllErrors());
        	
        	List <FieldError> allErrors = result.getFieldErrors();
        	for (FieldError er : allErrors) {
        		String errorField = er.getField();
        		switch(errorField) {
        			case "userName":
        				model.addAttribute("userError","User name must be unique");
        				model.addAttribute("invalidUserName","is-invalid");
        				break;
        			case "email":
        				model.addAttribute("emailError","Someone already registered with this e-mail");
        				model.addAttribute("invalidEmail","is-invalid");
        				break;
        			case "passwordConfirmation":
        				model.addAttribute("passwordError","Password must be at least 8 characters and agree");
        				model.addAttribute("invalidPassword","is-invalid");
        				break;
        		}
        	}
        	redirectAttributes.addFlashAttribute("registrationError", "Unable to register new user");
    		return "login_registration.jsp"; // Go back to registration page - do NOT redirect, otherwise error messages will NOT pop up
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/load"; // Send to load route to load other session attributes (then redirect to main page)
    }
    
    @PostMapping(value="/login")
    public String loginUser(@Valid @ModelAttribute("user") User u, BindingResult result, 
    		@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session,
    		RedirectAttributes redirectAttributes) {
    	if (userService.authenticateUser(email, password)) { // If user is authenticated - i.e. log-in is successful
    		User user = userService.findByEmail(email); // Get user
    		session.setAttribute("userId", user.getId()); // Store user's id in session
    		return "redirect:/load"; // Send to load route to load other session attributes (then redirect to main page)
    	} else {
    		System.out.println("Cannot log in");
    		model.addAttribute("loginError", "E-mail and/or password are incorrect");
    		model.addAttribute("invalidLogin","is-invalid"); // For displaying errors in log-in form
    		model.addAttribute("email", email);
    		// redirectAttributes.addFlashAttribute("loginError", "E-mail and/or password are incorrect");
    		return "login_registration.jsp"; // Send back to log-in page - do NOT redirect, otherwise error messages will NOT pop up
    	}
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate(); // Invalidate session - it's over
    	return "redirect:/"; // Send to log-in page
    }
}