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


// API 키: 75df104409445c36a314b12eb0aa5fdb
// API 요청 예시: https://api.themoviedb.org/3/movie/550?api_key=75df104409445c36a314b12eb0aa5fdb
// API 읽기 액세스 토큰:  eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NWRmMTA0NDA5NDQ1YzM2YTMxNGIxMmViMGFhNWZkYiIsInN1YiI6IjY0NWQxNDg2M2ZlMTYwMDE3MjI2N2FhMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VAMyXI3CfXx3hI3LNDWVJDxMt7a-uy1Pq2ay6NTJ18M
