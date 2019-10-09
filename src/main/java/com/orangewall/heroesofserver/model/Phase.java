
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("phase")
public class Phase {
    
    @PrimaryKey private Integer numPhase;
    private Integer codPart;
    private String namPhase;
    private Integer valIniPlayerMoney;
    private Integer valIniIAMoney;
    private PhaseType idtPhaseType;

    
    public Phase(Integer numPhase, Integer codPart, String namPhase
            , Integer vlrIniPlayerMoney, Integer vlrIniIAMoney, PhaseType idtPhaseType) {
        this.numPhase = numPhase;
        this.codPart = codPart;
        this.namPhase = namPhase;
        this.valIniPlayerMoney = valIniPlayerMoney;
        this.valIniIAMoney = valIniIAMoney;
        this.idtPhaseType = idtPhaseType;
    }    
    
    public Phase() {
    }
    
    public Integer getNumPhase() {
        return numPhase;
    }

    public void setNumPhase(Integer numPhase) {
        this.numPhase = numPhase;
    }

    public Integer getCodPart() {
        return codPart;
    }

    public void setCodPart(Integer codPart) {
        this.codPart = codPart;
    }

    public String getNamPhase() {
        return namPhase;
    }

    public void setNamPhase(String namPhase) {
        this.namPhase = namPhase;
    }

    public Integer getValIniPlayerMoney() {
        return valIniPlayerMoney;
    }

    public void setValIniPlayerMoney(Integer valIniPlayerMoney) {
        this.valIniPlayerMoney = valIniPlayerMoney;
    }

    public Integer getValIniIAMoney() {
        return valIniIAMoney;
    }

    public void setValIniIAMoney(Integer valIniIAMoney) {
        this.valIniIAMoney = valIniIAMoney;
    }

    public PhaseType getIdtPhaseType() {
        return idtPhaseType;
    }

    public void setIdtPhaseType(PhaseType idtPhaseType) {
        this.idtPhaseType = idtPhaseType;
    }
    
}
