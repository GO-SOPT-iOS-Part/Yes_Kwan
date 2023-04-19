//
//  UITextField+.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/19.
//

import Foundation
import UIKit

// 텍스트필드 왼쪽 들여쓰기, placeholder 색깔 지정 메서드 정의
extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
