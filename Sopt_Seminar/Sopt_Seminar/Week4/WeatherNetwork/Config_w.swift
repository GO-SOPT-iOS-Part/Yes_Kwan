//
//  Config.swift
//  WeatherAPI_Practice
//
//  Created by 김응관 on 2023/05/06.
//

import Foundation

enum Config_w {
    
    enum Keys {
        // URL
        enum Plist {
            static let weatherURL = "Weather_URL"
            static let API_Key = "API_Key"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config_w {
    
    static let weatherURL: String = {
        guard let key = Config_w.infoDictionary[Keys.Plist.weatherURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        
        return key
    }()
    
    static let API_Key: String = {
        guard let API_Key = Config_w.infoDictionary[Keys.Plist.API_Key] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        
        return API_Key
    }()
}
