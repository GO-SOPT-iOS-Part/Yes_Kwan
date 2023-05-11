//
//  MovieConfig.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/12.
//

import Foundation

enum MovieConfig {
    
    enum Keys {
        enum Plist {
            static let movieURL = "Movie_URL"
            static let API_Key = "MovieAPI_Key"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary
        else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension MovieConfig {
    static let movieURL: String = {
        guard let key = MovieConfig.infoDictionary[Keys.Plist.movieURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
    
    static let API_Key: String = {
        guard let API_Key = MovieConfig.infoDictionary[Keys.Plist.API_Key] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return API_Key
    }()
}
