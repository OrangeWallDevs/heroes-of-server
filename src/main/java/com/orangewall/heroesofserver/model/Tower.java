
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("tower")
public class Tower {

    @PrimaryKey private Integer codTower;
    private Integer valHp;
    private Integer numEffectArea;

    public Tower(Integer codTower, Integer valHp, Integer numEffectArea) {
        this.codTower = codTower;
        this.valHp = valHp;
        this.numEffectArea = numEffectArea;
    }

    public Tower() {
    }

    public Integer getCodTower() {
        return codTower;
    }

    public void setCodTower(Integer codTower) {
        this.codTower = codTower;
    }

    public Integer getValHp() {
        return valHp;
    }

    public void setValHp(Integer valHp) {
        this.valHp = valHp;
    }

    public Integer getNumEffectArea() {
        return numEffectArea;
    }

    public void setNumEffectArea(Integer numEffectArea) {
        this.numEffectArea = numEffectArea;
    }
    
}
