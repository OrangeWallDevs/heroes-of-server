
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("troop")
public class Troop {
    
    @PrimaryKey private Integer codTroop;
    private String namTroop;
    private Integer vlrDamageDealt;
    private Integer vlrHp;
    private Integer vlrScore;
    private Integer vlrMotionSpeed;
    private Integer vlrAttackSpeed;
    private Integer vlrDropMoney;

    public Troop(Integer codTroop, String namTroop, Integer vlrDamageDealt, Integer vlrHp, Integer vlrScore, Integer vlrMotionSpeed, Integer vlrAttackSpeed, Integer vlrDropMoney) {
        this.codTroop = codTroop;
        this.namTroop = namTroop;
        this.vlrDamageDealt = vlrDamageDealt;
        this.vlrHp = vlrHp;
        this.vlrScore = vlrScore;
        this.vlrMotionSpeed = vlrMotionSpeed;
        this.vlrAttackSpeed = vlrAttackSpeed;
        this.vlrDropMoney = vlrDropMoney;
    }

    public Troop() {
    }

    public Integer getCodTroop() {
        return codTroop;
    }

    public void setCodTroop(Integer codTroop) {
        this.codTroop = codTroop;
    }

    public String getNamTroop() {
        return namTroop;
    }

    public void setNamTroop(String namTroop) {
        this.namTroop = namTroop;
    }

    public Integer getVlrDamageDealt() {
        return vlrDamageDealt;
    }

    public void setVlrDamageDealt(Integer vlrDamageDealt) {
        this.vlrDamageDealt = vlrDamageDealt;
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
