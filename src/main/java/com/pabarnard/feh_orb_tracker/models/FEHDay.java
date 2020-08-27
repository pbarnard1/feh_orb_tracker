package com.pabarnard.feh_orb_tracker.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="fehdays")
public class FEHDay {
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date orbDate;
    
	// Pairs of events: orbs with descriptions
    @Min(value=0, message="Cannot be negative")
    private Integer storyParalogueOrbs = 0;
    private String storyParalogueDesc = "";
    
    @Min(value=0, message="Cannot be negative")
    private Integer chainChallengeOrbs = 0;
    private String chainChallengeDesc = "";
    
    @Min(value=0, message="Cannot be negative")
    private Integer squadAssaultOrbs = 0;
    private String squadAssaultDesc = "";
    
    @Min(value=0, message="Cannot be negative")
    private Integer arenaOrbs = 0;
    private String arenaDesc = "";
    
    @Min(value=0, message="Cannot be negative")
    private Integer rivalDomainsOrbs = 0;
    private String rivalDomainsDesc = "";
    
    @Min(value=0, message="Cannot be negative")
    private Integer heroBattleOrbs = 0;
    private String heroBattleDesc = "";
    
    @Min(value=0, message="Cannot be negative")
    private Integer tacticsDrillOrbs = 0;
    private String tacticsDrillDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer allegianceBattleOrbs = 0;
    private String allegianceBattleDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer tempestTrialsOrbs = 0;
    private String tempestTrialsDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer tapBattleOrbs = 0;
    private String tapBattleDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer grandConquestRokkrSiegesOrbs = 0;
    private String grandConquestRokkrSiegesDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer forgingBondsHallOfFormsOrbs = 0;
    private String forgingBondsHallOfFormsDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer lostLoreOrbs = 0;
    private String lostLoreDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer questOrbs = 0;
    private String questDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer loginBonusOrbs = 0;
    private String loginBonusDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer eventOrbs = 0;
    private String eventDesc = "";

    @Min(value=0, message="Cannot be negative")
    private Integer compensationOrbs = 0;
    private String compensationDesc = "";
    
    private Integer totalOrbs = 0;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    // Constructors
    public FEHDay() {
    	
    }
    public FEHDay(Date orbDate) {
		this.orbDate = orbDate;
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
	public Date getOrbDate() {
		return orbDate;
	}
	public void setOrbDate(Date orbDate) {
		this.orbDate = orbDate;
	}
	public Integer getStoryParalogueOrbs() {
		return storyParalogueOrbs;
	}
	public void setStoryParalogueOrbs(Integer storyParalogueOrbs) {
		this.storyParalogueOrbs = storyParalogueOrbs;
	}
	public String getStoryParalogueDesc() {
		return storyParalogueDesc;
	}
	public void setStoryParalogueDesc(String storyParalogueDesc) {
		this.storyParalogueDesc = storyParalogueDesc;
	}
	public Integer getChainChallengeOrbs() {
		return chainChallengeOrbs;
	}
	public void setChainChallengeOrbs(Integer chainChallengeOrbs) {
		this.chainChallengeOrbs = chainChallengeOrbs;
	}
	public String getChainChallengeDesc() {
		return chainChallengeDesc;
	}
	public void setChainChallengeDesc(String chainChallengeDesc) {
		this.chainChallengeDesc = chainChallengeDesc;
	}
	public Integer getSquadAssaultOrbs() {
		return squadAssaultOrbs;
	}
	public void setSquadAssaultOrbs(Integer squadAssaultOrbs) {
		this.squadAssaultOrbs = squadAssaultOrbs;
	}
	public String getSquadAssaultDesc() {
		return squadAssaultDesc;
	}
	public void setSquadAssaultDesc(String squadAssaultDesc) {
		this.squadAssaultDesc = squadAssaultDesc;
	}
	public Integer getArenaOrbs() {
		return arenaOrbs;
	}
	public void setArenaOrbs(Integer arenaOrbs) {
		this.arenaOrbs = arenaOrbs;
	}
	public String getArenaDesc() {
		return arenaDesc;
	}
	public void setArenaDesc(String arenaDesc) {
		this.arenaDesc = arenaDesc;
	}
	public Integer getRivalDomainsOrbs() {
		return rivalDomainsOrbs;
	}
	public void setRivalDomainsOrbs(Integer rivalDomainsOrbs) {
		this.rivalDomainsOrbs = rivalDomainsOrbs;
	}
	public String getRivalDomainsDesc() {
		return rivalDomainsDesc;
	}
	public void setRivalDomainsDesc(String rivalDomainsDesc) {
		this.rivalDomainsDesc = rivalDomainsDesc;
	}
	public Integer getHeroBattleOrbs() {
		return heroBattleOrbs;
	}
	public void setHeroBattleOrbs(Integer heroBattleOrbs) {
		this.heroBattleOrbs = heroBattleOrbs;
	}
	public String getHeroBattleDesc() {
		return heroBattleDesc;
	}
	public void setHeroBattleDesc(String heroBattleDesc) {
		this.heroBattleDesc = heroBattleDesc;
	}
	public Integer getTacticsDrillOrbs() {
		return tacticsDrillOrbs;
	}
	public void setTacticsDrillOrbs(Integer tacticsDrillOrbs) {
		this.tacticsDrillOrbs = tacticsDrillOrbs;
	}
	public String getTacticsDrillDesc() {
		return tacticsDrillDesc;
	}
	public void setTacticsDrillDesc(String tacticsDrillDesc) {
		this.tacticsDrillDesc = tacticsDrillDesc;
	}
	public Integer getAllegianceBattleOrbs() {
		return allegianceBattleOrbs;
	}
	public void setAllegianceBattleOrbs(Integer allegianceBattleOrbs) {
		this.allegianceBattleOrbs = allegianceBattleOrbs;
	}
	public String getAllegianceBattleDesc() {
		return allegianceBattleDesc;
	}
	public void setAllegianceBattleDesc(String allegianceBattleDesc) {
		this.allegianceBattleDesc = allegianceBattleDesc;
	}
	public Integer getTempestTrialsOrbs() {
		return tempestTrialsOrbs;
	}
	public void setTempestTrialsOrbs(Integer tempestTrialsOrbs) {
		this.tempestTrialsOrbs = tempestTrialsOrbs;
	}
	public String getTempestTrialsDesc() {
		return tempestTrialsDesc;
	}
	public void setTempestTrialsDesc(String tempestTrialsDesc) {
		this.tempestTrialsDesc = tempestTrialsDesc;
	}
	public Integer getTapBattleOrbs() {
		return tapBattleOrbs;
	}
	public void setTapBattleOrbs(Integer tapBattleOrbs) {
		this.tapBattleOrbs = tapBattleOrbs;
	}
	public String getTapBattleDesc() {
		return tapBattleDesc;
	}
	public void setTapBattleDesc(String tapBattleDesc) {
		this.tapBattleDesc = tapBattleDesc;
	}
	public Integer getGrandConquestRokkrSiegesOrbs() {
		return grandConquestRokkrSiegesOrbs;
	}
	public void setGrandConquestRokkrSiegesOrbs(Integer grandConquestRokkrSiegesOrbs) {
		this.grandConquestRokkrSiegesOrbs = grandConquestRokkrSiegesOrbs;
	}
	public String getGrandConquestRokkrSiegesDesc() {
		return grandConquestRokkrSiegesDesc;
	}
	public void setGrandConquestRokkrSiegesDesc(String grandConquestRokkrSiegesDesc) {
		this.grandConquestRokkrSiegesDesc = grandConquestRokkrSiegesDesc;
	}
	public Integer getForgingBondsHallOfFormsOrbs() {
		return forgingBondsHallOfFormsOrbs;
	}
	public void setForgingBondsHallOfFormsOrbs(Integer forgingBondsHallOfFormsOrbs) {
		this.forgingBondsHallOfFormsOrbs = forgingBondsHallOfFormsOrbs;
	}
	public String getForgingBondsHallOfFormsDesc() {
		return forgingBondsHallOfFormsDesc;
	}
	public void setForgingBondsHallOfFormsDesc(String forgingBondsHallOfFormsDesc) {
		this.forgingBondsHallOfFormsDesc = forgingBondsHallOfFormsDesc;
	}
	public Integer getLostLoreOrbs() {
		return lostLoreOrbs;
	}
	public void setLostLoreOrbs(Integer lostLoreOrbs) {
		this.lostLoreOrbs = lostLoreOrbs;
	}
	public String getLostLoreDesc() {
		return lostLoreDesc;
	}
	public void setLostLoreDesc(String lostLoreDesc) {
		this.lostLoreDesc = lostLoreDesc;
	}
	public Integer getQuestOrbs() {
		return questOrbs;
	}
	public void setQuestOrbs(Integer questOrbs) {
		this.questOrbs = questOrbs;
	}
	public String getQuestDesc() {
		return questDesc;
	}
	public void setQuestDesc(String questDesc) {
		this.questDesc = questDesc;
	}
	public Integer getLoginBonusOrbs() {
		return loginBonusOrbs;
	}
	public void setLoginBonusOrbs(Integer loginBonusOrbs) {
		this.loginBonusOrbs = loginBonusOrbs;
	}
	public String getLoginBonusDesc() {
		return loginBonusDesc;
	}
	public void setLoginBonusDesc(String loginBonusDesc) {
		this.loginBonusDesc = loginBonusDesc;
	}
	public Integer getEventOrbs() {
		return eventOrbs;
	}
	public void setEventOrbs(Integer eventOrbs) {
		this.eventOrbs = eventOrbs;
	}
	public String getEventDesc() {
		return eventDesc;
	}
	public void setEventDesc(String eventDesc) {
		this.eventDesc = eventDesc;
	}
	public Integer getCompensationOrbs() {
		return compensationOrbs;
	}
	public void setCompensationOrbs(Integer compensationOrbs) {
		this.compensationOrbs = compensationOrbs;
	}
	public String getCompensationDesc() {
		return compensationDesc;
	}
	public void setCompensationDesc(String compensationDesc) {
		this.compensationDesc = compensationDesc;
	}
	public Integer getTotalOrbs() {
		return totalOrbs;
	}
	public void setTotalOrbs(Integer totalOrbs) {
		this.totalOrbs = totalOrbs;
	}
}
