
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.PrimaryKey;
import com.orangewall.heroesofserver.annotation.Entity;

@Entity("scene")
public class Scene {
    
    @PrimaryKey private Integer codCutscene;
    @PrimaryKey private Integer codScene;
    private String desScene;
    private String txtImagePath;

    public Scene(Integer codCutscene, Integer codScene, String desScene) {
        this.codCutscene = codCutscene;
        this.codScene = codScene;
        this.desScene = desScene;
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

    public String getDesScene() {
        return desScene;
    }

    public void setDesScene(String desScene) {
        this.desScene = desScene;
    }

    public String getTxtImagePath() {
        return txtImagePath;
    }

    public void setTxtImagePath(String txtImagePath) {
        this.txtImagePath = txtImagePath;
    }
    
}
