//
//  MyPageViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/03.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController, UIScrollViewDelegate {
    
    private let dummy = ["이용권", "1:1 문의내역", "예약알림", "회원정보 수정", "프로모션 정보 수신 동의"]
    
    // 테이블 뷰 생성
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        return table
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
        self.tabBarController?.tabBar.tintColor = .black
        
//        ad.addTarget(self, action: #selector(gotoBuy), for: .touchUpInside)
    }
}

extension MyPageViewController {
    
    func setStyle() {
        view.backgroundColor = .black
        
        tableView.do {
            $0.register(ProfileView.self, forCellReuseIdentifier: ProfileView.className)
            $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.className)
            $0.register(ADView.self, forCellReuseIdentifier: ADView.className)
            $0.register(CashTicketView.self, forCellReuseIdentifier: CashTicketView.className)
            
            $0.rowHeight = 55
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    func viewSetting() {
        view.addSubview(tableView)
    }
    
    func setLayOut() {
        
        // 3. 레이아웃 설정
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc
    func bellBtnAction() {
        print(#function)
    }
    
    @objc
    func geatBtnAction() {
        print(#function)
    }
    
    @objc
    func gotoBuy() {
        let purchaseViewController = PurchaseViewController()
        self.navigationController?.pushViewController(purchaseViewController, animated: true)
    }
}


extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileView.className, for: indexPath) as? ProfileView else { return UITableViewCell() }
            return cell
        
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CashTicketView.className, for: indexPath) as? CashTicketView else { return UITableViewCell() }
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ADView.className, for: indexPath) as? ADView else { return UITableViewCell() }
            return cell
        
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.className, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
            
            cell.setText(dummy[indexPath.row - 3])
            return cell
        }
    }
}
