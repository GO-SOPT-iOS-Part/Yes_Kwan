//
//  BaseView.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/22.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {}
    func setLayout() {}
}
