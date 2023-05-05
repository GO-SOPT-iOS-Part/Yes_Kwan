//
//  LogOutButtonView.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit
import SnapKit

class LogOutButtonView: UITableViewCell {
    
    // 로그아웃 버튼
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(named: "darkest")?.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        button.layer.cornerRadius = 5
        button.titleLabel?.textColor = UIColor(named: "textColor")
        return button
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
    }
    
    func setLayOut() {
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logOutButton)
        
        logOutButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(90)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 15, bottom: 10, right: 15))
    }
    
    func setText(_ target: String) {
        logOutButton.setTitle(target, for: .normal)
    }
    
}
