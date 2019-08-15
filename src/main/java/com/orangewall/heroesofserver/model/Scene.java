
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("scene")
public class Scene {
    
    @PrimaryKey private Integer codCutscene;
    @PrimaryKey private Integer codScene;
    private String txtMessage;

    public Scene(Integer codCutscene, Integer codScene, String txtMessage) {
        this.codCutscene = codCutscene;
        this.codScene = codScene;
        this.txtMessage = txtMessage;
    }

    public Scene() {
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

    public String getTxtMessage() {
        return txtMessage;
    }

    public void setTxtMessage(String txtMessage) {
        this.txtMessage = txtMessage;
    }

    @Override
    public String toString() {
        return String.format("{cutscene: %d, scene: %d, message: %s}", codCutscene, codScene, txtMessage);
    }
    
}
