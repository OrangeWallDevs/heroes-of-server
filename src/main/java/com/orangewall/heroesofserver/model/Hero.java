
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("hero")
public class Hero {
    
    @PrimaryKey private Integer codHero;
    private Integer codPart;
    private String namHero;
    private String desHero;
    private Integer vlrHp;
    private Integer vlrScore;
    private Integer vlrDamageDealt;
    private Integer vlrMotionSpeed;
    private Integer vlrAttackSpeed;
    private Integer vlrDropMoney;

    public Hero(Integer codHero, Integer codPart, String namHero, String desHero, Integer vlrHp, Integer vlrScore, Integer vlrDamageDealt, Integer vlrMotionSpeed, Integer vlrAttackSpeed, Integer vlrDropMoney) {
        this.codHero = codHero;
        this.codPart = codPart;
        this.namHero = namHero;
        this.desHero = desHero;
        this.vlrHp = vlrHp;
        this.vlrScore = vlrScore;
        this.vlrDamageDealt = vlrDamageDealt;
        this.vlrMotionSpeed = vlrMotionSpeed;
        this.vlrAttackSpeed = vlrAttackSpeed;
        this.vlrDropMoney = vlrDropMoney;
    }

    public Hero() {
    }

    public Integer getCodHero() {
        return codHero;
    }

    public void setCodHero(Integer codHero) {
        this.codHero = codHero;
    }

    public Integer getCodPart() {
        return codPart;
    }

    public void setCodPart(Integer codPart) {
        this.codPart = codPart;
    }

    public String getNamHero() {
        return namHero;
    }

    public void setNamHero(String namHero) {
        this.namHero = namHero;
    }

    public String getDesHero() {
        return desHero;
    }

    public void setDesHero(String desHero) {
        this.desHero = desHero;
    }

    public Integer getVlrHp() {
        return vlrHp;
    }

    public void setVlrHp(Integer vlrHp) {
        this.vlrHp = vlrHp;
    }

    public Integer getVlrScore() {
        return vlrScore;
    }

    public void setVlrScore(Integer vlrScore) {
        this.vlrScore = vlrScore;
    }

    public Integer getVlrDamageDealt() {
        return vlrDamageDealt;
    }

    public void setVlrDamageDealt(Integer vlrDamageDealt) {
        this.vlrDamageDealt = vlrDamageDealt;
    }

    public Integer getVlrMotionSpeed() {
        return vlrMotionSpeed;
    }

    public void setVlrMotionSpeed(Integer vlrMotionSpeed) {
        this.vlrMotionSpeed = vlrMotionSpeed;
    }

    public Integer getVlrAttackSpeed() {
        return vlrAttackSpeed;
    }

    public void setVlrAttackSpeed(Integer vlrAttackSpeed) {
        this.vlrAttackSpeed = vlrAttackSpeed;
    }

    public Integer getVlrDropMoney() {
        return vlrDropMoney;
    }

    public void setVlrDropMoney(Integer vlrDropMoney) {
        this.vlrDropMoney = vlrDropMoney;
    }
    
    
}
