//
//  NSObject+.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/22.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
