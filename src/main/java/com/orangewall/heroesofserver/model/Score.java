
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("score")
public class Score {
    
   @PrimaryKey private String idtGoogleAccount;
   @PrimaryKey private Integer numPhase;  
    private Integer vlrRecordPoints;

    public Score(String idtGoogleAccount, Integer numPhase, Integer vlrRecordPoints) {
        this.idtGoogleAccount = idtGoogleAccount;
        this.numPhase = numPhase;
        this.vlrRecordPoints = vlrRecordPoints;
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

    public Integer getVlrRecordPoints() {
        return vlrRecordPoints;
    }

    public void setVlrRecordPoints(Integer vlrRecordPoints) {
        this.vlrRecordPoints = vlrRecordPoints;
    }

    
    
    
}
