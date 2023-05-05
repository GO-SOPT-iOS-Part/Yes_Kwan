//
//  MyPageViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/03.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController, UITableViewDelegate {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .black
        return table
    }()
    
//    let prof = ProfileView()
//    let cashe = CashTicketView()
//    let ad = ADView()
    
//    // 스크롤 뷰 생성
//    private let scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .black
//        view.showsVerticalScrollIndicator = true
//        return view
//    }()
    
//    // 0. 뷰들을 담을 Vertical StackView
//    private let stackView: UIStackView = {
//        let vertical = UIStackView()
//        vertical.translatesAutoresizingMaskIntoConstraints = false
//        vertical.axis = .vertical
//        vertical.spacing = 30
//        vertical.distribution = .equalSpacing
//        return vertical
//    }()
    
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
        
//        ad.addTarget(self, action: #selector(gotoBuy), for: .touchUpInside)
        
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension MyPageViewController {
    
    private func setStyle() {
        view.backgroundColor = .black
        
        tableView.do {
            $0.register(StackViewCell.self, forCellReuseIdentifier: StackViewCell.className)

            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    func viewSetting() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayOut() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
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
    
    @objc
    func gotoBuy() {
        let purchaseViewController = PurchaseViewController()
        self.navigationController?.pushViewController(purchaseViewController, animated: true)
    }
}

extension MyPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StackViewCell.className, for: indexPath) as? StackViewCell else { return UITableViewCell() }
        
//        cell.setText(dummy[indexPath.row])
        
        return cell
    }
}
