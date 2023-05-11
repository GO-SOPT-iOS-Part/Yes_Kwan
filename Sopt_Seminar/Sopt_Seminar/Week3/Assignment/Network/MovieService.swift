//
//  MovieService.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/12.
//



import Alamofire
import Foundation

final class MovieService {
    
    static let shared = MovieService()
    
    private init() {}
    
    //75df104409445c36a314b12eb0aa5fdb
    
    func getInfo(key: String, completion: @escaping (NetworkState<Any>) -> Void) {
        
        let header: HTTPHeader = [ 
        
        ]
        
        
    }
    
    
    
}
