//
//  SetTableViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit
import SnapKit

class SetTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setStyle()
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
        loadView()
    }
    
    private let dummy = ["이용권", "1:1 문의내역", "예약알림", "회원정보 수정", "프로모션 정보 수신 동의"]
    
    private func setStyle() {
        self.backgroundColor = .black
    }

    private func loadView() {
        self.do {
            $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.className)
            $0.rowHeight = 55
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension SetTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.className, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
        
        cell.setText(dummy[indexPath.row])
        
        return cell
    }
}
