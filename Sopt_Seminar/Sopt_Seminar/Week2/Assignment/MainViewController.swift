//
//  MainViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/18.
//

import Foundation
import SnapKit
import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    typealias sendEmail = ((String) -> (Void))
    var completionHandler: sendEmail?
    
    // 1. chevron backward SF Symbols
    private let chevron: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.backward")
        img.tintColor = UIColor.white
        return img
    }()
    
    // 2. TVING ID 로그인 문구
    private let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    // 3. ID TextField
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.textColor = UIColor(named: "textColor")
        textField.backgroundColor = UIColor(named: "darkest")
        textField.setPlaceholder(color: UIColor(named: "textColor") ?? .white)
        textField.addLeftPadding()
        textField.textFieldBtn(0)
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        return textField
    }()
    
    // 4. Password TextField
    private let pwTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호"
        textField.textColor = UIColor(named: "textColor")
        textField.backgroundColor = UIColor(named: "darkest")
        textField.tintColor = UIColor(named: "textColor")
        textField.setPlaceholder(color: UIColor(named: "textColor") ?? .white)
        textField.addLeftPadding()
        textField.textFieldBtn(1)
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        return textField
    }()
    
    // 5. 로그인하기 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = UIColor.black
        button.layer.borderWidth = 0.7
        button.layer.borderColor = UIColor(named: "darkest")?.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        button.layer.cornerRadius = 5
        return button
    }()
    
    // 6. 아이디 찾기 label
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디 찾기  "
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    // 7. 구분선
    private let lindLabel: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "textFieldbackground")
        return label
    }()
    
    // 8. 비밀번호 찾기 label
    private let pwLabel: UILabel = {
        let label = UILabel()
        label.text = "   비밀번호 찾기"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "textColor")
        return label
    }()
    
    // 9. 아직 계정이 없으신가요?
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIColor(named: "textFieldbackground")
        return label
    }()
    
    // 10. 닉네임 만들러가기 버튼
    private lazy var nickNameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.setTitleColor(UIColor(named: "tappedBorder"), for: .normal)
        button.setUnderline()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayOut()
        
        pwTextField.textFieldBtn(1)
        
        idTextField.delegate = self
        idTextField.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .touchDown)
        idTextField.addTarget(self, action: #selector(loginbtnActivate), for: .allEditingEvents)
        
        pwTextField.delegate = self
        pwTextField.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .touchDown)
        pwTextField.addTarget(self, action: #selector(loginbtnActivate), for: .allEditingEvents)
    }
    
    @objc
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "textColor")?.cgColor
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 5
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0.0
    }
    
    @objc func loginbtnActivate() {
        guard let email = idTextField.text else { return }
        guard let password = pwTextField.text else { return }
        
        if email.isValidEmail() && password.count >= 8 {
            loginButton.backgroundColor = UIColor.red
            loginButton.isEnabled = true
            loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        } else {
            loginButton.backgroundColor = UIColor.black
            loginButton.isEnabled = false
        }
    }
}

private extension MainViewController {
    
    // 뷰의 배경색을 지정해준다
    func style() {
        view.backgroundColor = .black
    }
    
    // 오토레이아웃 지정
    func setLayOut() {
        
        [chevron, guideLabel, idTextField, pwTextField, loginButton, idLabel, lindLabel, pwLabel, questionLabel, nickNameButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([guideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lindLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.centerXAnchor.constraint(equalTo: idLabel.centerXAnchor),
            nickNameButton.centerYAnchor.constraint(equalTo: questionLabel.centerYAnchor)])
        
        chevron.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.top.equalToSuperview().offset(100)
            $0.height.equalTo(24)
            $0.width.equalTo(15)
        }
        
        guideLabel.snp.makeConstraints {
            $0.top.equalTo(chevron.snp.top).offset(35)
        }
        
        idTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(guideLabel.snp.bottom).offset(35)
            $0.height.equalTo(55)
        }
        
        pwTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(idTextField.snp.bottom).offset(10)
            $0.height.equalTo(55)
        }
        
        loginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(pwTextField.snp.bottom).offset(20)
            $0.height.equalTo(55)
        }
        
        idLabel.snp.makeConstraints {
            $0.trailing.equalTo(lindLabel.snp.leading).offset(-40)
            $0.top.equalTo(loginButton.snp.bottom).offset(25)
        }
        
        lindLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(25)
        }
        
        pwLabel.snp.makeConstraints {
            $0.leading.equalTo(lindLabel.snp.trailing).offset(40)
            $0.top.equalTo(loginButton.snp.bottom).offset(25)
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(30)
        }
        
        nickNameButton.snp.makeConstraints {
            $0.top.equalTo(pwLabel.snp.bottom).offset(30)
            $0.leading.equalTo(pwLabel.snp.leading)
        }
    }
    
    @objc
    func login() {
        let loginSuccessViewController = LoginSuccessViewController()
        
        // 입력된 이메일 값 받아오고, completionHandler 클로저를 통해 데이터 전달
        guard let mails = idTextField.text else { return }
        completionHandler?(mails)
        
        // 화면이동
        self.navigationController?.pushViewController(loginSuccessViewController, animated: true)
    }
    
}
