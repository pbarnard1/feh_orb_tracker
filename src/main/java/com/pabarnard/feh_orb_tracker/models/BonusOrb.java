package com.pabarnard.feh_orb_tracker.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="bonusorbs")
public class BonusOrb {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

    @ManyToOne
    @JoinColumn(name="extraArenaOrbsUser_id")
    private User extraArenaOrbsUser;
    
    @ManyToOne
    @JoinColumn(name="extraAllegianceBattleOrbsUser_id")
    private User extraAllegianceBattleOrbsUser;

    private Boolean isExtraArenaOrbChecked = false;
    private Boolean isExtraAllegianceBattleOrbChecked = false;
    
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date extraOrbDate;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    // Constructors
    public BonusOrb() {
    	
    }
    public BonusOrb(Date extraOrbDate) {
		this.extraOrbDate = extraOrbDate;
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
	public User getExtraArenaOrbsUser() {
		return extraArenaOrbsUser;
	}
	public void setExtraArenaOrbsUser(User extraArenaOrbsUser) {
		this.extraArenaOrbsUser = extraArenaOrbsUser;
	}
	public User getExtraAllegianceBattleOrbsUser() {
		return extraAllegianceBattleOrbsUser;
	}
	public void setExtraAllegianceBattleOrbsUser(User extraAllegianceBattleOrbsUser) {
		this.extraAllegianceBattleOrbsUser = extraAllegianceBattleOrbsUser;
	}
	public Boolean getIsExtraArenaOrbChecked() {
		return isExtraArenaOrbChecked;
	}
	public void setIsExtraArenaOrbChecked(Boolean isExtraArenaOrbChecked) {
		this.isExtraArenaOrbChecked = isExtraArenaOrbChecked;
	}
	public Boolean getIsExtraAllegianceBattleOrbChecked() {
		return isExtraAllegianceBattleOrbChecked;
	}
	public void setIsExtraAllegianceBattleOrbChecked(Boolean isExtraAllegianceBattleOrbChecked) {
		this.isExtraAllegianceBattleOrbChecked = isExtraAllegianceBattleOrbChecked;
	}
	public Date getExtraOrbDate() {
		return extraOrbDate;
	}
	public void setExtraOrbDate(Date extraOrbDate) {
		this.extraOrbDate = extraOrbDate;
	}
}
