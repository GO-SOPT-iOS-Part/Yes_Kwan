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
    //ko
    
    func getInfo(key: String, language: String, adult: Bool, video: Bool, page: Int, completion: @escaping (NetworkState<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        let url = MovieConfig.movieURL + "api_key=\(key)&include_adult=\(adult)&include_video=\(video)&language=\(language)&page=\(page)&sort_by=popularity.desc"
        
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
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkState<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 201: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkState<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(Welcome.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
