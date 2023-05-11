//
//  WeatherService.swift
//  WeatherAPI_Practice
//
//  Created by 김응관 on 2023/05/06.
//

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

import Foundation
import Alamofire

final class WeatherService {
    
    static let shared = WeatherService()
    
    private init() {}
    
    //q=seoul&appid=0d268b100aab2067be1aeebe6b626058
    //https://api.themoviedb.org/3/discover/movie

    func getInfo(key: String,
                 city: String,
                 completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = Config_w.weatherURL + "q=\(city)&appid=\(key)"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(url, method: .get, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 201: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(Weathers.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
