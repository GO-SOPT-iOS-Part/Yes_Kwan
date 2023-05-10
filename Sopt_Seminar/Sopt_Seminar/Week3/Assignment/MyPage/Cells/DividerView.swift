//
//  DividerView.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit
import SnapKit

class DividerView: UITableViewCell {
    
    private let line: UIImageView = {
        let sun = UIImageView()
        sun.image = UIImage(named: "line")
        return sun
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
        line.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(line)
        
        line.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1)
            $0.leading.equalTo(contentView.snp.leading).inset(15)
            $0.trailing.equalTo(contentView.snp.trailing).inset(15)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(7)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0))
    }
}
