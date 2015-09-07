package grailswebapp

class BrandController {

    def index() {
        render "this is brand index method"
    }

    def form(){
        render(view: "form")
    }


    def addBrand(){
        def brand = new Brand(params)
        if(brand.searchTerm.equals(null)){
            brand.searchTerm = "#"+brand.brandName
        }
        println(brand.save())
        redirect(action: "list")
    }

    def list(){
        def brand = Brand.list()
        [brand:brand]
    }

    def deleteBrand(){
        def brandName = params.brandName
        def searchTerm = params.searchTerm
        def brand = Brand.findByBrandNameAndSearchTerm(brandName,searchTerm)
        brand.delete(flash:true)

        redirect(action: "list",view:"list")
    }
}
