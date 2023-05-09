//
//  MyPageViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/03.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController, UITableViewDelegate, UIScrollViewDelegate {
        
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .black
        return table
    }()
    
    var lis: [String] = Array()
    var index = 0
    var limit = 7
    
    private let dummy = ["스택", "이용권", "1:1 문의내역", "예약알림", "회원정보 수정", "프로모션 정보 수신 동의", "선", "공지사항", "이벤트", "고객센터", "티빙 알아보기", "로그아웃"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 백버튼 틴트컬러 변경 & Back 글자 삭제
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = ""
        
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
        
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    
}

extension MyPageViewController {
    
    private func setStyle() {
        view.backgroundColor = .black
        
        tableView.do {
            $0.register(StackViewCell.self, forCellReuseIdentifier: StackViewCell.className)
            $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.className)
            $0.register(DividerView.self, forCellReuseIdentifier: DividerView.className)
            $0.register(AnotherTableViewCell.self, forCellReuseIdentifier: AnotherTableViewCell.className)
            $0.register(LogOutButtonView.self, forCellReuseIdentifier: LogOutButtonView.className)
            
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func viewSetting() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setLayOut() {
        tableView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.center.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
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

extension MyPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StackViewCell.className, for: indexPath) as? StackViewCell else { return UITableViewCell() }
            return cell
            
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DividerView.className, for: indexPath) as? DividerView else { return UITableViewCell() }
            return cell
            
        case 1...5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.className, for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }
            
            cell.setText(dummy[indexPath.row])
            return cell
        
        case 11:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LogOutButtonView.className, for: indexPath) as? LogOutButtonView else { return UITableViewCell() }
            cell.setText(dummy[indexPath.row])
            cell.delegate = self
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AnotherTableViewCell.className, for: indexPath) as? AnotherTableViewCell else { return UITableViewCell() }
            
            cell.getText(dummy[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            self.perform(#selector(loadTable), with: nil, afterDelay: 0.5)
        }
    }
    
    @objc
    func loadTable() {
        self.tableView.reloadData()
    }
}

extension MyPageViewController: LogOut {
    func logOut() {
        UserDefaults.standard.set(LoginState.logOut.rawValue, forKey: "loginState")
        self.navigationController?.popViewController(animated: true)
    }
}
