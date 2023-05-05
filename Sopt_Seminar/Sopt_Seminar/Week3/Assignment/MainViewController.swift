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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(gotoMyPage))
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
}

