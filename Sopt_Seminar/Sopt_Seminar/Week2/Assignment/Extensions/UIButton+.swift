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
}
