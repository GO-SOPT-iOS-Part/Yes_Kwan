//
//  DataBindProtocol.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/08.
//

import Foundation

// AnyObject를 상속한 프로토콜은 클래스만 채택할 수 있다!
protocol DataBindProtocol: AnyObject {
    func dataBind(text: String)
}
