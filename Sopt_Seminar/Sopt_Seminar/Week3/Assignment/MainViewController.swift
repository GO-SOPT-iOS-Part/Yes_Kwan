//
//  MainViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/03.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        
        
        // 1. 로그인 여부 확인
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(gotoMyPage))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logo_tving"), style: .plain, target: self, action: #selector(scrollUp))
        
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationItem.rightBarButtonItem?.tintColor = .white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.hidesBackButton = true
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
}

