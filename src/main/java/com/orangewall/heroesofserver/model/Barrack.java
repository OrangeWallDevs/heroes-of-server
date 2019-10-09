
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("barrack")
public class Barrack {
    
    @PrimaryKey private Integer codBarrack;
    private Integer codPart;
    private Integer codTroop;
    private String namBarrack;
    private String desBarrack;
    private Integer valSpawnFrequency;
    private Integer valCost;
    private Integer numTroopLimit;

    public Barrack(Integer codBarrack, Integer codPart, Integer codTroop, String namBarrack, String desBarrack, Integer valSpawnFrequency, Integer valCost, Integer numTroopLimit) {
        this.codBarrack = codBarrack;
        this.codPart = codPart;
        this.codTroop = codTroop;
        this.namBarrack = namBarrack;
        this.desBarrack = desBarrack;
        this.valSpawnFrequency = valSpawnFrequency;
        this.valCost = valCost;
        this.numTroopLimit = numTroopLimit;
    }

    public Barrack() {
    }

    public Integer getCodBarrack() {
        return codBarrack;
    }

    public void setCodBarrack(Integer codBarrack) {
        this.codBarrack = codBarrack;
    }

    public Integer getCodPart() {
        return codPart;
    }

    public void setCodPart(Integer codPart) {
        this.codPart = codPart;
    }

    public Integer getCodTroop() {
        return codTroop;
    }

    public void setCodTroop(Integer codTroop) {
        this.codTroop = codTroop;
    }

    public String getNamBarrack() {
        return namBarrack;
    }

    public void setNamBarrack(String namBarrack) {
        this.namBarrack = namBarrack;
    }

    public String getDesBarrack() {
        return desBarrack;
    }

    public void setDesBarrack(String desBarrack) {
        this.desBarrack = desBarrack;
    }

    public Integer getValSpawnFrequency() {
        return valSpawnFrequency;
    }

    public void setValSpawnFrequency(Integer valSpawnFrequency) {
        this.valSpawnFrequency = valSpawnFrequency;
    }

    public Integer getValCost() {
        return valCost;
    }

    public void setValCost(Integer valCost) {
        this.valCost = valCost;
    }

    public Integer getNumTroopLimit() {
        return numTroopLimit;
    }

    public void setNumTroopLimit(Integer numTroopLimit) {
        this.numTroopLimit = numTroopLimit;
    }    
    
}
