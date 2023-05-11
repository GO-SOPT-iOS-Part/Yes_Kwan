//
//  ViewController.swift
//  WeatherAPI_Practice
//
//  Created by 김응관 on 2023/05/06.
//






import UIKit
import SnapKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    private func getWeather() {
        
        WeatherService.shared.getInfo(key: "0d268b100aab2067be1aeebe6b626058",
                                    city: "seoul") { response in

            switch response {
            case .success(let data):
                guard let data = data as? Weathers else { return }
                dump(data)
            default:
                return
            }
        }
    }
}

