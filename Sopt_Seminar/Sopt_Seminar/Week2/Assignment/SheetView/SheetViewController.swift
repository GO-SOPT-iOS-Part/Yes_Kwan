//
//  SheetViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/24.
//

import UIKit
import SnapKit

// iOS 15버전 이상부터는 UISheetPresentationController에 접근하여 간편하게 Sheet Modal 구현이 가능함
class SheetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layOut()
    }

    // 1. 닉네임을 입력해주세요
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    // 2. 닉네임 입력 텍스티필드
    lazy var nickNameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.placeholder = "닉네임을 입력하세요"
        textField.setPlaceholder(color: .black)
        textField.backgroundColor = UIColor(named: "tappedBorder")
        textField.addLeftPadding()
        return textField
    }()
    
    // 3. 저장하기 버튼
    lazy var saveBtn: UIButton = {
        let saving = UIButton()
        saving.backgroundColor = .red
        saving.setTitle("저장하기", for: .normal)
        saving.setTitleColor(.white, for: .normal)
        saving.layer.cornerRadius = 10
        return saving
    }()
}

extension SheetViewController {
    
    func style() {
        view.backgroundColor = .white
    }
    
    func layOut() {
        
        [guideLabel, nickNameTextField, saveBtn].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            guideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            nickNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        ])
        
        guideLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(guideLabel.snp.bottom).offset(15)
            $0.leading.equalTo(guideLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        saveBtn.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.equalTo(guideLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}
