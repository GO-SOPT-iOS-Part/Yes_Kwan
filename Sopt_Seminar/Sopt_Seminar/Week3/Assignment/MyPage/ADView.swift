//
//  ADView.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit
import SnapKit

class ADView: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
        loadView()
    }
    
    private let horizonStackView: UIStackView = {
        let horizon = UIStackView()
        horizon.axis = .horizontal
        horizon.spacing = 2
        horizon.alignment = .center
        horizon.distribution = .fill
        return horizon
    }()
    
    private let adLabel: UILabel = {
        let advertise = UILabel()
        advertise.text = "이용권을 구매하고"
        advertise.textColor = UIColor(named: "textColor")
        advertise.font = .systemFont(ofSize: 13)
        return advertise
    }()
    
    private let tvnImg: UIImageView = {
        let tvn = UIImageView()
        tvn.image = UIImage(named: "tvn")?.resized(withPercentage: 0.7)
        tvn.contentMode = .scaleAspectFit
        return tvn
    }()
    
    private let jtbcImg: UIImageView = {
        let jtbc = UIImageView()
        jtbc.image = UIImage(named: "jtbc")?.resized(withPercentage: 0.7)
        jtbc.contentMode = .scaleAspectFit
        return jtbc
    }()
    
    private let secondLabel: UILabel = {
        let second = UILabel()
        second.text = "등 인기 TV프로그램과"
        second.textColor = UIColor(named: "textColor")
        second.font = .systemFont(ofSize: 13)
        return second
    }()
    
    private let lasLabel: UILabel = {
        let last = UILabel()
        last.text = "다양한 영화 콘텐츠를 자유롭게 시청하세요!"
        last.textColor = UIColor(named: "textColor")
        last.font = .systemFont(ofSize: 13)
        return last
    }()
    
    private let rightChevron: UIImageView = {
        let chevron = UIImageView()
        chevron.image = UIImage(systemName: "chevron.right")
        chevron.tintColor = .white
        return chevron
    }()
    
    private func style() {
        self.backgroundColor = UIColor(named: "darkest")
        self.layer.cornerRadius = 5
    }
    
    private func loadView() {
        [adLabel, tvnImg, jtbcImg, secondLabel, lasLabel, rightChevron].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            adLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            adLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            lasLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            rightChevron.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            rightChevron.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        tvnImg.snp.makeConstraints {
            $0.top.equalTo(adLabel.snp.top)
            $0.leading.equalTo(adLabel.snp.trailing).offset(6)
        }
        
        jtbcImg.snp.makeConstraints {
            $0.top.equalTo(adLabel.snp.top).offset(-20)
            $0.leading.equalTo(tvnImg.snp.trailing).offset(-4)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(adLabel.snp.top)
            $0.leading.equalTo(jtbcImg.snp.trailing).offset(-4)
        }
        
        lasLabel.snp.makeConstraints {
            $0.top.equalTo(adLabel.snp.bottom).offset(10)
            $0.leading.equalTo(adLabel.snp.leading)
        }

        self.frame = bounds
    }
}
