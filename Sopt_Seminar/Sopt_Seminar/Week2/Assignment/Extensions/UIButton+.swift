//
//  UIButton+.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/19.
//

import Foundation
import UIKit

// 버튼에 밑줄을 추가해주는 함수 추가정의
extension UIButton {
    
    // 버튼에 밑줄 추가해주는 함수
    @objc
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
    // 정규식과 비밀번호 길이에 따른 버튼 배경색 설정 함수
    @objc
    func buttonBackground(id: String, pw: String) {
        if id.isValidEmail() && pw.count >= 8 {
            self.backgroundColor = UIColor.red
        } else {
            self.backgroundColor = UIColor(named: "darkest")
        }
    }
}
