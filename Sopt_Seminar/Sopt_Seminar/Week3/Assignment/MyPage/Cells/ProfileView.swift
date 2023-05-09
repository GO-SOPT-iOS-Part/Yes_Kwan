//
//  ProfileViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/04.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
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
    
    private func loadView() {
        
        [profile, name, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: self.topAnchor),
            profile.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            profile.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor)
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
        }
        
        self.frame = bounds
    }
}
