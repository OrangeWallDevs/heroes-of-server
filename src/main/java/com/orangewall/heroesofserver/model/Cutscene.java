
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("cutscene")
public class Cutscene {
    @PrimaryKey private int codCutscene;
     private int codPart;

    public Cutscene(int codCutscene, int codPart) {
        this.codCutscene = codCutscene;
        this.codPart = codPart;
    }

    public Cutscene() {
    }

    public int getCodCutscene() {
        return codCutscene;
    }

    public void setCodCutscene(int codCutscene) {
        this.codCutscene = codCutscene;
    }

    public int getCodPart() {
        return codPart;
    }

    public void setCodPart(int codPart) {
        this.codPart = codPart;
    }
     
     
    

}
