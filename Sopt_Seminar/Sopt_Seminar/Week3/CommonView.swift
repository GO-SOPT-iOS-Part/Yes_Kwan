//
//  CommonView.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/22.
//

import Foundation
import UIKit
import Then
import SnapKit

// 코드 양을 줄이기 위해서 별도의 UIView 객체생성
final class CommonView: BaseView {
    
    let nameLabel = UILabel().then {
        $0.text = "이름이 무엇인가요!?"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .blue
        $0.textAlignment = .center
    }
    
    let nameTextField = UITextField().then {
        $0.placeholder = "이름을 입력해주세요"
        $0.clearButtonMode = .whileEditing
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
    }
    
    let backButton = UIButton().then {
        $0.setTitle("뒤로가기!", for: .normal)
        $0.backgroundColor = .red
        $0.setTitleColor(.blue, for: .normal)
    }
    
    override func setLayout() {
        
        [nameLabel, backButton, nameTextField]
            .forEach { addSubview($0) }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(nameLabel.self).inset(30)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.self).offset(-50)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(48)
        }
    }
}
