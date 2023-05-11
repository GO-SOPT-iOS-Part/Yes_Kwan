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
        
        let url = 
        
        
    }
    
    
    
}

//import Foundation
//let headers = [
//  "accept": "application/json",
//  "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NWRmMTA0NDA5NDQ1YzM2YTMxNGIxMmViMGFhNWZkYiIsInN1YiI6IjY0NWQxNDg2M2ZlMTYwMDE3MjI2N2FhMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VAMyXI3CfXx3hI3LNDWVJDxMt7a-uy1Pq2ay6NTJ18M"
//]
//
//let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")! as URL,
//                                        cachePolicy: .useProtocolCachePolicy,
//                                    timeoutInterval: 10.0)
//request.httpMethod = "GET"
//request.allHTTPHeaderFields = headers
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//  if (error != nil) {
//    print(error as Any)
//  } else {
//    let httpResponse = response as? HTTPURLResponse
//    print(httpResponse)
//  }
//})
//
//dataTask.resume()
