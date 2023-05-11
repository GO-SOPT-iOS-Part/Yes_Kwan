//
//  PurchaseViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/05.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    private let adLabel: UILabel = {
        let advertise = UILabel()
        advertise.text = "이용권을 구매하고"
        advertise.textColor = UIColor(named: "textColor")
        advertise.font = .systemFont(ofSize: 13)
        return advertise
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(adLabel)
        // Do any additional setup after loading the view.
    }
}
