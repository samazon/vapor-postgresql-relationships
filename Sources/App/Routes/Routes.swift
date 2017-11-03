import Vapor

extension Droplet {
    func setupRoutes() throws {
        // get("hello") { req in
        //     var json = JSON()
        //     try json.set("hello", "world")
        //     return json
        // }

        // get("plaintext") { req in
        //     return "Hello, world!"
        // }

        // // response to requests to /info domain
        // // with a description of the request
        // get("info") { req in
        //     return req.description
        // }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
        // resource("lessons", LessonController.self)

        let lessonController = LessonController()
        resource("lessons", lessonController)
        lessonController.addRoutes(self)
        
        let teacherController = TeacherController()
        resource("teachers", teacherController)
        teacherController.addRoutes(self)
        
        let studentController = StudentController()
        resource("students", studentController)
        studentController.addRouters(self)
    }
}
