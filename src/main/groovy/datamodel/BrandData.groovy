package datamodel

/**
 * Created by kiran on 8/30/15.
 */

class BrandData {

    String brandName
    String searchTerm

    String getBrandName() {
        return brandName
    }

    void setBrandName(String brandName) {
        this.brandName = brandName
    }

    String getSearchTerm() {
        return searchTerm
    }

    void setSearchTerm(String searchTerm) {
        this.searchTerm = searchTerm
    }
}
