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
    
    // 데이터전달에 사용될 클로저의 타입을 handler로 정의
    typealias handler = ((String) -> (Void))
    
    var compHandler: handler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layOut()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveBtn.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
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
        saving.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
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
    
    // 닉네임 저장하기 버튼을 누르면 값이 전달되면서 sheet가 닫히게 하는 함수
    @objc
    func backToMain() {
        guard let text = nickNameTextField.text else { return }
        compHandler?(text)
        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
}
