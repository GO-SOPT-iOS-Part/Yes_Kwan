//
//  CashTicketView.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit
import SnapKit

class CashTicketView: UITableViewCell {
    
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
    
    // 0. 티켓 이미지
    private let card: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "ticket")
        img.tintColor = UIColor(named: "textFieldbackground")
        return img
    }()
    
    
    // 1. 나의 이용권
    private let ticket: UILabel = {
        let ticketing = UILabel()
        ticketing.text = "나의 이용권"
        ticketing.textColor = UIColor(named: "textColor")
        ticketing.font = .systemFont(ofSize: 13)
        return ticketing
    }()
    
    // 2. 사용중인 이용권이 없습니다.
    private let none: UILabel = {
        let tickets = UILabel()
        tickets.text = "사용중인 이용권이 없습니다."
        tickets.textColor = UIColor(named: "textColor")
        tickets.font = .systemFont(ofSize: 13)
        return tickets
    }()
    
    // 3. cash image
    private let cash: UIImageView = {
        let imgs = UIImageView()
        imgs.image = UIImage(systemName: "c.circle")
        imgs.tintColor = UIColor(named: "textFieldbackground")
        return imgs
    }()
    
    // 4. 티빙캐시
    private let tvingCash: UILabel = {
        let tvCash = UILabel()
        tvCash.text = "티빙캐시"
        tvCash.textColor = UIColor(named: "textColor")
        tvCash.font = .systemFont(ofSize: 13)
        return tvCash
    }()
    
    // 5. 잔액
    private let money: UILabel = {
        let money = UILabel()
        money.text = "0"
        money.textColor = .white
        money.font = .systemFont(ofSize: 13)
        return money
    }()
    
    private func setStyle() {
        self.backgroundColor = UIColor(named: "darkest")
        self.layer.cornerRadius = 5
        separatorInset.left = 0
        selectionStyle = .none
    }
    
    private func setLayOut() {
        
        [card, ticket, none, cash, tvingCash, money].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            card.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            none.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cash.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
        card.snp.makeConstraints {
            $0.height.equalTo(23)
            $0.width.equalTo(23)
        }
        
        ticket.snp.makeConstraints {
            $0.leading.equalTo(card.snp.trailing).offset(18)
            $0.centerY.equalTo(card.snp.centerY)
        }
        
        none.snp.makeConstraints {
            $0.centerY.equalTo(card.snp.centerY)
        }
        
        cash.snp.makeConstraints {
            $0.top.equalTo(card.snp.bottom).offset(20)
            $0.leading.equalTo(card.snp.leading)
            $0.width.equalTo(23)
            $0.height.equalTo(23)
        }
        
        tvingCash.snp.makeConstraints {
            $0.centerY.equalTo(cash.snp.centerY)
            $0.leading.equalTo(cash.snp.trailing).offset(18)
        }
        
        money.snp.makeConstraints {
            $0.centerY.equalTo(cash.snp.centerY)
            $0.trailing.equalTo(none.snp.trailing)
        }
    }
    
}
