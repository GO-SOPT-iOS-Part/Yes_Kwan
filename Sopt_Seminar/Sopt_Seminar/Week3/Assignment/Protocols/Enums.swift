//
//  UserInfo.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/08.
//

import Foundation

enum LoginState: String {
    case logIn
    case logOut
}

enum NetworkState<T> {
    case success(T)     // 서버 통신 성공
    case requestErr(T)  // 요청에러 발생
    case pathErr // 경로 에러
    case serverErr  // 서버 내부 에러
    case networkErr // 네트워크 연결 실패
}
