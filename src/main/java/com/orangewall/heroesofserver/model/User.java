
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("user")
public class User {
    
    @PrimaryKey  private String idtGoogleAccount;
    private Integer numCurrentPhase;
    private String namUser;

    public User(String idtGoogleAccount, Integer numCurrentPhase, String namUser) {
        this.idtGoogleAccount = idtGoogleAccount;
        this.numCurrentPhase = numCurrentPhase;
        this.namUser = namUser;
    }

    public User() {
    }

    public String getIdtGoogleAccount() {
        return idtGoogleAccount;
    }

    public void setIdtGoogleAccount(String idtGoogleAccount) {
        this.idtGoogleAccount = idtGoogleAccount;
    }

    public Integer getNumCurrentPhase() {
        return numCurrentPhase;
    }

    public void setNumCurrentPhase(Integer numCurrentPhase) {
        this.numCurrentPhase = numCurrentPhase;
    }

    public String getNamUser() {
        return namUser;
    }

    public void setNamUser(String namUser) {
        this.namUser = namUser;
    }
    
    
}
