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
        layoutSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
        setLayOut()
        layoutSubviews()
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
        
        section.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(10)
            $0.leading.equalTo(contentView.snp.leading).inset(10)
            $0.centerY.equalTo(contentView.snp.centerY)
        }
    
        chevron.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(10)
            $0.centerY.equalTo(section.snp.centerY)
            $0.trailing.equalTo(contentView.snp.trailing).inset(10)
            $0.height.equalTo(35)
        }
    }
    
    func setText(_ data: String) {
        section.text = data
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10))
    }
}
