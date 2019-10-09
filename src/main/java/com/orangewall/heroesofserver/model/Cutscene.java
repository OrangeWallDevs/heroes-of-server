
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("cutscene")
public class Cutscene {
    
    @PrimaryKey private Integer codCutscene;
     private Integer codPart;

    public Cutscene(Integer codCutscene, Integer codPart) {
        this.codCutscene = codCutscene;
        this.codPart = codPart;
    }

    public Cutscene() {
    }

    public Integer getCodCutscene() {
        return codCutscene;
    }

    public void setCodCutscene(Integer codCutscene) {
        this.codCutscene = codCutscene;
    }

    public Integer getCodPart() {
        return codPart;
    }

    public void setCodPart(Integer codPart) {
        this.codPart = codPart;
    }

}
