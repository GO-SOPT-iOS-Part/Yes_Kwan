//
//  LoginSuccessViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/20.
//

import Foundation
import UIKit
import SnapKit

class LoginSuccessViewController: UIViewController {
    
    var userEmail: String = ""
    
    // 1. TVING image
    private let logoImg: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")?.resized(withPercentage: 0.5)
        return logo
    }()
    
    // 2. 로그인 시 얻은 이메일 문자열 가져와서 보여주는 label
    private let emailLabel: UILabel = {
        let email = UILabel()
        email.font = .systemFont(ofSize: 18, weight: UIFont.Weight(rawValue: 3.0))
        email.textColor = .white
        return email
    }()
    
    // 3. 반가워요!
    private let welcome: UILabel = {
        let greeting = UILabel()
        greeting.text = "반가워요!"
        greeting.font = .systemFont(ofSize: 18, weight: UIFont.Weight(rawValue: 3.0))
        greeting.textColor = .white
        return greeting
    }()
    
    // 4. 돌아가기 버튼
    private let mainBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("메인으로", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layOut()
        nameBind()
    }
    
    func nameBind() {
        emailLabel.text = userEmail
    }
}

private extension LoginSuccessViewController {
    func style() {
        view.backgroundColor = .black
    }
    
    func layOut() {
        
        [logoImg, emailLabel, welcome, mainBtn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate(
            [logoImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             welcome.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             mainBtn.centerXAnchor.constraint(equalTo:
                view.centerXAnchor)])
        
        logoImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
        }
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(logoImg.snp.bottom).offset(85)
        }
        
        welcome.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(15)
        }
        
        mainBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-40)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(55)
        }
    }
}
