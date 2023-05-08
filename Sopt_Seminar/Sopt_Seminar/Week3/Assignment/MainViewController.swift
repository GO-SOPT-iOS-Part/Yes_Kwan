//
//  MainViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/03.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // 1. BarleftButton
    lazy private var leftButton: UIBarButtonItem = {
        let leftBtn = UIBarButtonItem(image: UIImage(named: "logo_tving")?.resized(toWidth: 99), style: .plain, target: self, action: #selector(scrollUp))
        leftBtn.tintColor = .white
        return leftBtn
    }()
    
    // 2.1 미로그인 시
    lazy private var loginBtn: UIBarButtonItem = {
        let rightBtn = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(gotoLogIn))
        rightBtn.tintColor = .white
        return rightBtn
    }()
    
    // 2.2 로그인 시
    lazy private var myPageBtn: UIBarButtonItem = {
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(gotoMyPage))
        rightBtn.tintColor = .white
        return rightBtn
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logo_tving")?.resized(toWidth: 99), style: .plain, target: self, action: #selector(scrollUp))

        // NavigationItem 색상 지정
        self.navigationItem.leftBarButtonItem = leftButton
        
        // 로그인 여부에 따라 다른 rightBarButton이 보이게끔 해주기
        if UserDefaults.standard.string(forKey: "loginState") == "logIn" {
            self.navigationItem.rightBarButtonItem = myPageBtn
        } else {
            self.navigationItem.rightBarButtonItem = loginBtn
        }
    }
}

extension MainViewController {
    func setStyle() {
        view.backgroundColor = .black
    }
    
    @objc
    func gotoMyPage() {
        let myPageViewController = MyPageViewController()
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
    
    @objc
    func scrollUp() {
        print(#function)
    }
    
    @objc
    func gotoLogIn() {
        let loginViewController = LogInViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}

