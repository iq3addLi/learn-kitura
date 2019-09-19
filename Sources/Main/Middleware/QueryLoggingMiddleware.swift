//
//  AddHelloMiddleware.swift
//  Main
//
//  Created by iq3AddLi on 2019/09/17.
//

import Foundation
import Kitura

class QueryLoggingMiddleware: RouterMiddleware{
    
    func handle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws{
        print("""
            <request description>
            method=\(request.method)
            header=\(request.headers.map{ ($0,$1) })
            queryParameters=\(request.queryParameters)
            body=\(String(describing: request.body))
            userInfo=\(request.userInfo)
            """
        )
        // read body
        var data = Data()
        do {
            _ = try request.read(into: &data)
        }catch(let e){
            print(e)
        }
        print("data=\(data)")
        
        // read body with codable
        do {
            let book = try request.read(as: Book.self)
            print("book=\(book)")
        }catch(let e){
            print(e)
        }
        
        next()
    }
}
