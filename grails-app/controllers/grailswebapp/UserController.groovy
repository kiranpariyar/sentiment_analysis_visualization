package grailswebapp

class UserController {


    def index(){
        redirect(action: "login")
    }

    def login () {
        render (view: "login")
    }

   /* def form(){
        render (view: "form")
    }

    def addUser(){
        def user = new User(params)
        user.role = "admin"
        println(user.save())
        println user.firstName
        render "successfully added user"
    }*/

    def successMessage(){
        render "Successfully added User"
    }

    def loginHandle = {

        def username = params.username
        def password = params.password
        def user = User.findByUsernameAndPassword(username,password)

        println(user.getUsername())
        println(user.getPassword())

        if( user != null && user.role.equals("admin")){
            def adminUser = session['adminUser']
            session.adminUser = user
            redirect(controller: "home",action: "adminhome")
        }else if( user != null && user.role.equals("user")){
            def normalUser = session['normalUser']
            session.normalUser = user
            redirect(controller: "dashboard",action: "summary")
        }else {
            render(view: "invalid")
        }


       /* if (params.username == "kiran" && params.password == "kiran") {
            // username and password match -> log in
            session.user = "kiran"
            redirect(controller:'main',action: "home")
        } else {
            flash.message = "User not found"
            redirect(controller:'dashboard',action: "summary")
        }*/
    }

    def logout = {
        session.invalidate()
        render(view: "login")
    }

}
