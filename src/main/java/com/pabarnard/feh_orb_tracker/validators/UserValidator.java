package com.pabarnard.feh_orb_tracker.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.pabarnard.feh_orb_tracker.models.User;
import com.pabarnard.feh_orb_tracker.services.UserService;

@Component
public class UserValidator implements Validator {
	
	@Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
	
	@Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
        	// First String: fieldName in model, second String: CODE for custom validations,
        	// where CODE is used in a new file called messages.properties, found in src/main/resources
        	// Inside messages.properties:
        	// CODE.MethodAttribute.MemberVariable=YOUR CUSTOM ERROR MESSAGE
        	// e.g. Match.user.passwordConfirmation=Passwords must agree.
        	// user is from userValidator.validate(user, result)
            errors.rejectValue("passwordConfirmation", "Match");
        }
        if (user.getPasswordConfirmation().length() < 8) { // Added by me: password must be 8 or more characters
        	errors.rejectValue("passwordConfirmation", "Match");
        }
    }
	
	// Check to make sure e-mail is unique
	public void validateEmail(Object target, Errors errors, UserService userService) {
		User user = (User) target;
		User foundUser = userService.findByEmail(user.getEmail());
		if (foundUser != null) {
			errors.rejectValue("email", "Found");
		}
	}
}