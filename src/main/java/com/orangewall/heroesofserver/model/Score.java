
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("score")
public class Score {
    
   @PrimaryKey private String idtGoogleAccount;
   @PrimaryKey private Integer numPhase;  
    private Integer valRecordPoints;

    public Score(String idtGoogleAccount, Integer numPhase, Integer valRecordPoints) {
        this.idtGoogleAccount = idtGoogleAccount;
        this.numPhase = numPhase;
        this.valRecordPoints = valRecordPoints;
    }

    public Score() {
    }

    public String getIdtGoogleAccount() {
        return idtGoogleAccount;
    }

    public void setIdtGoogleAccount(String idtGoogleAccount) {
        this.idtGoogleAccount = idtGoogleAccount;
    }

    public Integer getNumPhase() {
        return numPhase;
    }

    public void setNumPhase(Integer numPhase) {
        this.numPhase = numPhase;
    }

    public Integer getValRecordPoints() {
        return valRecordPoints;
    }

    public void setValRecordPoints(Integer valRecordPoints) {
        this.valRecordPoints = valRecordPoints;
    }
    
}
