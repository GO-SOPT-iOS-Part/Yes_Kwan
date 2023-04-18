//
//  SecondViewController_Ex1.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/08.
//

import Foundation
import UIKit
import SnapKit

final class SecondViewController_Ex2: UIViewController {
    // 데이터 바인딩을 위한 타입을 선언
    typealias handler = ((Int) -> (Void))
    // 클로저 타입의 프로퍼티를 선언
    var completionHandler: handler?
    // 횟수를 집계할 변수 생성
    var count: Int = 0 
    
    // 횟수 증가 버튼
    private lazy var countButton: UIButton = {
        let button = UIButton()
        button.setTitle("눌러줘", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,
                         action: #selector(addCount),
                         for: .touchUpInside)
        return button
    }()
    
    // 이전으로 돌아가는 버튼
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전으로..", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,
                         action: #selector(popSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension SecondViewController_Ex2 {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        // 0. 만들어진 UIComponent들을 view에다가 추가
        [countButton, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        // 1. constraint 정의 & superView와 중심을 맞춰줌
        NSLayoutConstraint.activate([countButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        countButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(100)
            $0.trailing.equalToSuperview().offset(-100)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(100)
            $0.trailing.equalToSuperview().offset(-100)
            $0.top.equalTo(countButton.snp.bottom).offset(50)
            $0.height.equalTo(50)
        }
    }

    @objc
    func addCount() {
        count += 1
    }
    
    @objc
    func popSecondViewController() {
        completionHandler?(count)
        self.navigationController?.popViewController(animated: true)
    }
}
