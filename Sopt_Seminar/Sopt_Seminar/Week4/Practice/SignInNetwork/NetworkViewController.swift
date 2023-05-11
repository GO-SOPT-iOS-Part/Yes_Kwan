//
//  NetworkViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/06.
//

import UIKit
import SnapKit

final class NetworkViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        signUp()
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "seungchan@naver.com",
                                    nickname: "godios",
                                    password: "Qwer1234!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}
