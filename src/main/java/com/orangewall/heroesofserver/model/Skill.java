
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("skill")
public class Skill {
    
    @PrimaryKey private Integer codSkill;
    private Integer codHero;
    private String namSkill;
    private String desSkill;
    private Integer vlrDamage;
    private Integer numEffectArea;
    private Integer numCooldown;
    private boolean idtAttributeBuff;   

    public Skill(Integer codSkill, Integer codHero, String namSkill, String desSkill, Integer vlrDamage, Integer numEffectArea, Integer numCooldown, boolean idtAttributeBuff) {
        this.codSkill = codSkill;
        this.codHero = codHero;
        this.namSkill = namSkill;
        this.desSkill = desSkill;
        this.vlrDamage = vlrDamage;
        this.numEffectArea = numEffectArea;
        this.numCooldown = numCooldown;
        this.idtAttributeBuff = idtAttributeBuff;
    }

    public Skill() {
    }

    public Integer getCodSkill() {
        return codSkill;
    }

    public void setCodSkill(Integer codSkill) {
        this.codSkill = codSkill;
    }

    public Integer getCodHero() {
        return codHero;
    }

    public void setCodHero(Integer codHero) {
        this.codHero = codHero;
    }

    public String getNamSkill() {
        return namSkill;
    }

    public void setNamSkill(String namSkill) {
        this.namSkill = namSkill;
    }

    public String getDesSkill() {
        return desSkill;
    }

    public void setDesSkill(String desSkill) {
        this.desSkill = desSkill;
    }

    public Integer getVlrDamage() {
        return vlrDamage;
    }

    public void setVlrDamage(Integer vlrDamage) {
        this.vlrDamage = vlrDamage;
    }

    public Integer getNumEffectArea() {
        return numEffectArea;
    }

    public void setNumEffectArea(Integer numEffectArea) {
        this.numEffectArea = numEffectArea;
    }

    public Integer getNumCooldown() {
        return numCooldown;
    }

    public void setNumCooldown(Integer numCooldown) {
        this.numCooldown = numCooldown;
    }

    public boolean isIdtAttributeBuff() {
        return idtAttributeBuff;
    }

    public void setIdtAttributeBuff(boolean idtAttributeBuff) {
        this.idtAttributeBuff = idtAttributeBuff;
    }
    
    
    
}
