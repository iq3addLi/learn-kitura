//
//  Application.swift
//  Main
//
//  Created by iq3AddLi on 2019/09/17.
//

import Kitura
import Logging

class Application{
    
    lazy var router = {
        return Router()
    }()
    
    init(){
        // Set Loglevel
        var logger = Logger(label: "MyLogger")
        logger.logLevel = .trace
        Kitura.logTo(logger)
        
        // Test
        router.get("/hello") { request, response, next in
            response.send("Hello world!")
            next()
        }
        
        // Codable get & post
        let controller = BookController()
        router.get("/book", handler: controller.getBook )
        router.post("/book", handler: controller.postBook )
        
        // Add midlleware
        let middleware = QueryLoggingMiddleware()// logging middleware
        router.all("/book", middleware: middleware)
    }
    
    func launch(){
        // add HTTP Server
        Kitura.addHTTPServer(onPort: 8080, with: router)
        
        // Application Launch
        Kitura.run()
    }
}
