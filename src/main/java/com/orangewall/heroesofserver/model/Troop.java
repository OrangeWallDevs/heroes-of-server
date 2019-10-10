
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("troop")
public class Troop {
    
    @PrimaryKey private Integer codTroop;
    private String namTroop;
    private String txtAssetIdentifier;
    private Integer valDamageDealt;
    private Integer valHp;
    private Integer valScore;
    private Double valMotionSpeed;
    private Double valAttackSpeed;
    private Integer valDropMoney;

    public Troop(Integer codTroop, String namTroop, Integer valDamageDealt, Integer valHp, Integer valScore, Double valMotionSpeed, Double valAttackSpeed, Integer valDropMoney) {
        this.codTroop = codTroop;
        this.namTroop = namTroop;
        this.valDamageDealt = valDamageDealt;
        this.valHp = valHp;
        this.valScore = valScore;
        this.valMotionSpeed = valMotionSpeed;
        this.valAttackSpeed = valAttackSpeed;
        this.valDropMoney = valDropMoney;
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

    public String getTxtAssetIdentifier() {
        return txtAssetIdentifier;
    }

    public void setTxtAssetIdentifier(String txtAssetIdentifier) {
        this.txtAssetIdentifier = txtAssetIdentifier;
    }

    public Integer getValDamageDealt() {
        return valDamageDealt;
    }

    public void setValDamageDealt(Integer valDamageDealt) {
        this.valDamageDealt = valDamageDealt;
    }

    public Integer getValHp() {
        return valHp;
    }

    public void setValHp(Integer valHp) {
        this.valHp = valHp;
    }

    public Integer getValScore() {
        return valScore;
    }

    public void setValScore(Integer valScore) {
        this.valScore = valScore;
    }

    public Double getValMotionSpeed() {
        return valMotionSpeed;
    }

    public void setValMotionSpeed(Double valMotionSpeed) {
        this.valMotionSpeed = valMotionSpeed;
    }

    public Double getValAttackSpeed() {
        return valAttackSpeed;
    }

    public void setValAttackSpeed(Double valAttackSpeed) {
        this.valAttackSpeed = valAttackSpeed;
    }

    public Integer getValDropMoney() {
        return valDropMoney;
    }

    public void setValDropMoney(Integer valDropMoney) {
        this.valDropMoney = valDropMoney;
    }
    
}
