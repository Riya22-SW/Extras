//
//  ApiManager.swift
//  Coredatawithapi
//
//  Created by admin on 25/11/24.
//

import Foundation
import Alamofire

class ApiManager{
    let url="https://official-joke-api.appspot.com/jokes/random/25"
    
    
    func fetchjokes(completionHandler: @escaping(Result<[Jokemodel],Error>)-> Void){
        AF.request(url).responseDecodable(of:[Jokemodel].self){
            response in
            switch response.result{
            case.success(let data):
                completionHandler(.success(data))
            case.failure(let err):
                completionHandler(.failure(err))
            }
        }
    }
}
