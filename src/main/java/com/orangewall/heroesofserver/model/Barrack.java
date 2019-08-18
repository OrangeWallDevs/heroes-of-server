
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("barrack")
public class Barrack {
    
    @PrimaryKey private int codBarrack;
    private Integer codPart;
    private Integer codTroop;
    private String namBarrack;
    private String desBarrack;
    private Integer vlrSpawnFrequency;
    private Integer vlrCost;
    private Integer numTroopLimit;

    public Barrack(int codBarrack, Integer codPart, Integer codTroop, String namBarrack, String desBarrack, Integer vlrSpawnFrequency, Integer vlrCost, Integer numTroopLimit) {
        this.codBarrack = codBarrack;
        this.codPart = codPart;
        this.codTroop = codTroop;
        this.namBarrack = namBarrack;
        this.desBarrack = desBarrack;
        this.vlrSpawnFrequency = vlrSpawnFrequency;
        this.vlrCost = vlrCost;
        this.numTroopLimit = numTroopLimit;
    }

    public Barrack() {
    }

    public int getCodBarrack() {
        return codBarrack;
    }

    public void setCodBarrack(int codBarrack) {
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

    public Integer getVlrSpawnFrequency() {
        return vlrSpawnFrequency;
    }

    public void setVlrSpawnFrequency(Integer vlrSpawnFrequency) {
        this.vlrSpawnFrequency = vlrSpawnFrequency;
    }

    public Integer getVlrCost() {
        return vlrCost;
    }

    public void setVlrCost(Integer vlrCost) {
        this.vlrCost = vlrCost;
    }

    public Integer getNumTroopLimit() {
        return numTroopLimit;
    }

    public void setNumTroopLimit(Integer numTroopLimit) {
        this.numTroopLimit = numTroopLimit;
    }
    
    
    
}
