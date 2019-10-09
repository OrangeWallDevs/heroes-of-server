
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("part")
public class Part {
    
    @PrimaryKey private Integer codPart;
    private String namPart;

    public Part(Integer codPart, String namPart) {
        this.codPart = codPart;
        this.namPart = namPart;
    }

    public Part() {
    }

    public Integer getCodPart() {
        return codPart;
    }

    public void setCodPart(Integer codPart) {
        this.codPart = codPart;
    }

    public String getNamPart() {
        return namPart;
    }

    public void setNamPart(String namPart) {
        this.namPart = namPart;
    }
    
}
