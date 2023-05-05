//
//  SettingTableViewCell.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit
import SnapKit
import Then

class SettingTableViewCell: UITableViewCell {

    private let section = UILabel()
    
    private let chevron: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(systemName: "chevron.right")
        arrow.tintColor = .white
        return arrow
    }()
    
    // 테이블 뷰 셀 초기화 작업
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayOut()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
        setLayOut()
    }
    
    func setStyle() {
        separatorInset.left = 0
        selectionStyle = .none
        self.backgroundColor = .black
        
        section.do {
            $0.textColor = UIColor(named: "textColor")
            $0.font = UIFont.systemFont(ofSize: 13)
        }
    }
    
    func setLayOut() {
        [section, chevron].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            section.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            section.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            section.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            chevron.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            section.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        chevron.snp.makeConstraints {
            $0.centerY.equalTo(section.snp.centerY)
        }
    }
    
    func setText(_ data: String) {
        section.text = data
    }
}
