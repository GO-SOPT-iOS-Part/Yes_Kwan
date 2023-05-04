//
//  MyPageViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/03.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController {
    
    // 1. profile image
    private let profile: UIImageView = {
        let profile = UIImageView()
        profile.image = UIImage(named: "profile")
        profile.layer.cornerRadius = 15
        profile.clipsToBounds = true
        return profile
    }()
    
    // 2. name label
    private let name: UILabel = {
        let name = UILabel()
        name.text = "kwhn"
        name.textColor = .white
        name.font = .boldSystemFont(ofSize: 18.0)
        return name
    }()
    
    // 3. 프로필 전환 버튼
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("프로필 전환", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15)
        btn.layer.borderColor = UIColor(named: "darkest")?.cgColor
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1.0
        btn.backgroundColor = .black
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayOut()
        
        // 1. bell button
        let bell = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(bellBtnAction))
        bell.tintColor = .gray
        
        // 2. gear button
        let gear = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(geatBtnAction))
        gear.tintColor = .gray
        
        // 3. rightbarbutton에 추가
        self.navigationItem.rightBarButtonItems = [gear, bell]
    }
}

extension MyPageViewController {
    
    func setStyle() {
        view.backgroundColor = .black
    }
    
    func setLayOut() {
        
        [profile, name, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30.0),
            profile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0)
        ])
        
        profile.snp.makeConstraints {
            $0.height.equalTo(80)
            $0.width.equalTo(80)
        }
        
        name.snp.makeConstraints {
            $0.leading.equalTo(profile.snp.trailing).offset(25)
            $0.centerY.equalTo(profile.snp.centerY)
        }
        
        button.snp.makeConstraints {
            $0.centerY.equalTo(profile.snp.centerY)
            $0.width.equalTo(100)
            $0.height.equalTo(40)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    @objc
    func bellBtnAction() {
        print(#function)
    }
    
    @objc
    func geatBtnAction() {
        print(#function)
    }
}
