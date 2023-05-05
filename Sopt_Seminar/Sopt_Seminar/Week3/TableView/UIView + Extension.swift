//
//  UIView+.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/22.
//

import Foundation
import UIKit.UIView

extension UIView {
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
