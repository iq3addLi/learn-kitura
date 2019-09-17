//
//  BookController.swift
//  Main
//
//  Created by iq3AddLi on 2019/09/17.
//

import Foundation
import KituraContracts

struct BookController{
    
    func getBook( book: Book, completion: ([Book]?, RequestError?) -> Void) {
        completion( [book], nil )
    }
    
    func postBook( book: Book, completion: ([Book]?, RequestError?) -> Void) {
        completion( [book], nil )
    }
}
