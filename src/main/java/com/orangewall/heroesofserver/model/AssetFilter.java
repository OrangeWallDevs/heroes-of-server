
package com.orangewall.heroesofserver.model;

import com.orangewall.heroesofserver.annotation.Entity;
import com.orangewall.heroesofserver.annotation.PrimaryKey;

@Entity("assetfilter")
public class AssetFilter {
    
    @PrimaryKey private String namTable;
    private String txtAssetFilter;
    private String txtAssetPath;

    public AssetFilter(String namTable, String txtAssetFilter, String txtAssetPath) {
        this.namTable = namTable;
        this.txtAssetFilter = txtAssetFilter;
        this.txtAssetPath = txtAssetPath;
    }

    public AssetFilter() {
    }

    public String getNamTable() {
        return namTable;
    }

    public void setNamTable(String namTable) {
        this.namTable = namTable;
    }

    public String getTxtAssetFilter() {
        return txtAssetFilter;
    }

    public void setTxtAssetFilter(String txtAssetFilter) {
        this.txtAssetFilter = txtAssetFilter;
    }

    public String getTxtAssetPath() {
        return txtAssetPath;
    }

    public void setTxtAssetPath(String txtAssetPath) {
        this.txtAssetPath = txtAssetPath;
    }
    
}
