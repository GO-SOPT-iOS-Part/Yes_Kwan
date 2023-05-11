//
//  MovieViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/12.
//

import UIKit
import SnapKit

class MoviePosterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getMovie()
        // Do any additional setup after loading the view.
    }
    
    private func getMovie() {
        MovieService.shared.getInfo(key: "75df104409445c36a314b12eb0aa5fdb", language: "ko", adult: false, video: false, page: 1) { response in
            
            switch response {
            case .success(let data):
                guard let data = data as? Welcome else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
