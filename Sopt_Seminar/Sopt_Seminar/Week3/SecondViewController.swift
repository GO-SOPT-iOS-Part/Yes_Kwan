//
//  SecondViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/22.
//

import Foundation
import UIKit
import Then

final class SecondViewController: BaseViewController {
    
    private let originView = CommonView()
    
    override func loadView() {
        self.view = originView
    }
}
