
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("speak")
public class Speak {

    @PrimaryKey private Integer codSpeak;
    @PrimaryKey private Integer codCutscene;
    @PrimaryKey private Integer codScene;
    private String txtSpeak;

    public Speak(Integer codSpeak, Integer codCutscene, Integer codScene, String txtSpeak) {
        this.codSpeak = codSpeak;
        this.codCutscene = codCutscene;
        this.codScene = codScene;
        this.txtSpeak = txtSpeak;
    }

    public Speak() {
    }

    public Integer getCodSpeak() {
        return codSpeak;
    }

    public void setCodSpeak(Integer codSpeak) {
        this.codSpeak = codSpeak;
    }

    public Integer getCodCutscene() {
        return codCutscene;
    }

    public void setCodCutscene(Integer codCutscene) {
        this.codCutscene = codCutscene;
    }

    public Integer getCodScene() {
        return codScene;
    }

    public void setCodScene(Integer codScene) {
        this.codScene = codScene;
    }

    public String getTxtSpeak() {
        return txtSpeak;
    }

    public void setTxtSpeak(String txtSpeak) {
        this.txtSpeak = txtSpeak;
    }
    
}
