
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("tower")
public class Tower {

    @PrimaryKey private Integer codTower;
    private Integer vlrHp;
    private Integer numEffectArea;

    public Tower(Integer codTower, Integer vlrHp, Integer numEffectArea) {
        this.codTower = codTower;
        this.vlrHp = vlrHp;
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

    public Integer getVlrHp() {
        return vlrHp;
    }

    public void setVlrHp(Integer vlrHp) {
        this.vlrHp = vlrHp;
    }

    public Integer getNumEffectArea() {
        return numEffectArea;
    }

    public void setNumEffectArea(Integer numEffectArea) {
        this.numEffectArea = numEffectArea;
    }
    
    
}
