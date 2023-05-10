//
//  StackViewCell.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit
import SnapKit

class StackViewCell: UITableViewCell {
    
    let prof = ProfileView()
    let cashe = CashTicketView()
    let ad = ADView()
    
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
    
    private let stacks: UIStackView = {
        let vertical = UIStackView()
        vertical.translatesAutoresizingMaskIntoConstraints = false
        vertical.axis = .vertical
        vertical.spacing = 30
        vertical.distribution = .equalSpacing
        return vertical
    }()
    
    private func setStyle() {
        separatorInset.left = 0
        selectionStyle = .none
        self.backgroundColor = .black
    }
    
    private func setLayOut() {
        [prof, cashe, ad].forEach {
            stacks.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        contentView.addSubview(stacks)
        
        NSLayoutConstraint.activate([
            stacks.topAnchor.constraint(equalTo: contentView.topAnchor),
            stacks.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stacks.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stacks.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stacks.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        prof.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        cashe.snp.makeConstraints {
            $0.leading.equalTo(prof.snp.leading)
            $0.trailing.equalTo(prof.snp.trailing)
        }
        
        ad.snp.makeConstraints {
            $0.leading.equalTo(prof.snp.leading)
            $0.trailing.equalTo(prof.snp.trailing)
        }
    }
}

