//
//  MyPageViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/03.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController {
    
    let allView: UIView = {
        let views = UIView()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.backgroundColor = .black
        return views
    }()
    
    let prof = ProfileView()
    let cashe = CashTicketView()
    
    // 스크롤 뷰 생성
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.showsVerticalScrollIndicator = true
        return view
    }()
    
    // 0. 뷰들을 담을 Vertical StackView
    private let stackView: UIStackView = {
        let vertical = UIStackView()
        vertical.translatesAutoresizingMaskIntoConstraints = false
        vertical.axis = .vertical
        vertical.spacing = 30
        vertical.distribution = .equalSpacing
        return vertical
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        viewSetting()
        
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
        view.backgroundColor = .white
    }
    
    func viewSetting() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    
    
    func setLayOut() {
        
        [prof, cashe].forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        // 3. 레이아웃 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        prof.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        cashe.snp.makeConstraints {
            //$0.top.equalTo(prof.snp.bottom).offset(20)
            $0.leading.equalTo(prof.snp.leading)
            $0.trailing.equalTo(prof.snp.trailing)
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
