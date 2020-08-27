package com.pabarnard.feh_orb_tracker.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    @Email(message = "E-mail must be valid")
    private String email;
    @Size(min = 8, message = "Password must be at least 8 characters long")
    private String password;
    @Size(min = 1, message = "User name cannot be blank")
    private String userName;
    
    @OneToMany(mappedBy="extraArenaOrbsUser", fetch = FetchType.LAZY)
    private List<BonusOrb> bonusArenaOrbs;
    @OneToMany(mappedBy="extraAllegianceBattleOrbsUser", fetch = FetchType.LAZY)
    private List<BonusOrb> bonusAllegianceBattleOrbs;

    private Integer orbBalance = 0;
    
    @Transient
    private String passwordConfirmation;
        
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    // Empty constructor and constructor with fields
    public User() {
    	
    }
	public User(@Email(message = "E-mail must be valid") String email,
			@Size(min = 8, message = "Password must be at least 8 characters long") String password,
			@Size(min = 1, message = "User name cannot be blank") String userName) {
		this.email = email;
		this.password = password;
		this.userName = userName;
	}
	
	// Getters and setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public List<BonusOrb> getBonusArenaOrbs() {
		return bonusArenaOrbs;
	}
	public void setBonusArenaOrbs(List<BonusOrb> bonusArenaOrbs) {
		this.bonusArenaOrbs = bonusArenaOrbs;
	}
	public List<BonusOrb> getBonusAllegianceBattleOrbs() {
		return bonusAllegianceBattleOrbs;
	}
	public void setBonusAllegianceBattleOrbs(List<BonusOrb> bonusAllegianceBattleOrbs) {
		this.bonusAllegianceBattleOrbs = bonusAllegianceBattleOrbs;
	}
	public Integer getOrbBalance() {
		return orbBalance;
	}
	public void setOrbBalance(Integer orbBalance) {
		this.orbBalance = orbBalance;
	}
	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}
	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}
}