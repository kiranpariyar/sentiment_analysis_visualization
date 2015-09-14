package grailswebapp


class HomeController {

    def adminhome(){
    }

    def userform(){
        render(view: "userform")
    }

    def addUser(){
        def user = new User(params)
        user.role = "user"
        user.save()
        redirect(action: "list")
    }

    def list(){
        def userList = User.list()


        [user:user]
    }
}
