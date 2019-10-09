
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("speak")
public class Speak {

    @PrimaryKey private Integer codSpeak;
    @PrimaryKey private Integer codCutscene;
    @PrimaryKey private Integer codScene;
    private String txtSpeak;
    private String txtSceneImgPath;

    public Speak(Integer codSpeak, Integer codCutscene, Integer codScene, String txtSpeak, String txtSceneImgPath) {
        this.codSpeak = codSpeak;
        this.codCutscene = codCutscene;
        this.codScene = codScene;
        this.txtSpeak = txtSpeak;
        this.txtSceneImgPath = txtSceneImgPath;
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

    public String getTxtSceneImgPath() {
        return txtSceneImgPath;
    }

    public void setTxtSceneImgPath(String txtSceneImgPath) {
        this.txtSceneImgPath = txtSceneImgPath;
    }
    
}
