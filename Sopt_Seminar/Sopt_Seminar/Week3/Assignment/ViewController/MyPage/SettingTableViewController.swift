//
//  SettingTableViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit

class SettingTableViewController: UIViewController, UITableViewDelegate {
    
    // 1. 테이블 뷰 생성
    private let tableView = UITableView()
    private let dummy = ["이용권", "1:1 문의내역", "예약알림", "회원정보 수정", "프로모션 정보 수신 동의"]
    
    private func setStyle() {
        view.backgroundColor = .black
        
        tableView.do {
            $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.className)
            $0.rowHeight = 55
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setLayOut() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension SettingTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.className, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        
        cell.setText(dummy[indexPath.row])
        
        return cell
    }
}
