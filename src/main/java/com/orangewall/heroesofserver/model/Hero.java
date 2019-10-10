
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("hero")
public class Hero {
    
    @PrimaryKey private Integer codHero;
    private Integer codPart;
    private String namHero;
    private String desHero;
    private String txtAssetIdentifier;
    private Integer valHp;
    private Integer valScore;
    private Integer valDamageDealt;
    private Double valMotionSpeed;
    private Double valAttackSpeed;
    private Integer valDropMoney;

    public Hero(Integer codHero, Integer codPart, String namHero, String desHero, Integer valHp, Integer valScore, Integer valDamageDealt, Double valMotionSpeed, Double valAttackSpeed, Integer valDropMoney) {
        this.codHero = codHero;
        this.codPart = codPart;
        this.namHero = namHero;
        this.desHero = desHero;
        this.valHp = valHp;
        this.valScore = valScore;
        this.valDamageDealt = valDamageDealt;
        this.valMotionSpeed = valMotionSpeed;
        this.valAttackSpeed = valAttackSpeed;
        this.valDropMoney = valDropMoney;
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

    public String getTxtAssetIdentifier() {
        return txtAssetIdentifier;
    }

    public void setTxtAssetIdentifier(String txtAssetIdentifier) {
        this.txtAssetIdentifier = txtAssetIdentifier;
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

    public Integer getValDamageDealt() {
        return valDamageDealt;
    }

    public void setValDamageDealt(Integer valDamageDealt) {
        this.valDamageDealt = valDamageDealt;
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
