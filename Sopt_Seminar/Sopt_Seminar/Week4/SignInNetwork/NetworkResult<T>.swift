//
//  NetworkResult<T>.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/06.
//

import Foundation

enum NetworkResult<T> {
    case success(T)     // 서버 통신 성공
    case requestErr(T)  // 요청에러 발생
    case pathErr // 경로 에러
    case serverErr  // 서버 내부 에러
    case networkErr // 네트워크 연결 실패
}

// 네트워크 통신 결과로 넘어오는 JSON 데이터를 앱이 이해할 수 있는 형태인 Swift로
// 변환하기 위함 -> json 형식과 대응되는 데이터 모델

// 데이터 모델을 Encode/Decode 하기 위한 Codable 채택
// data 넘어오는게 실패했을시에 null 처리를 하기위해 옵셔널로 타입 지정
struct SignUpResponse: Codable {
    let code: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let userId: Int
    let nickname: String
}
