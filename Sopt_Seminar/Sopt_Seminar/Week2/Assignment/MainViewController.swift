//
//  MainViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/18.
//

import Foundation
import SnapKit
import UIKit

class MainViewController: UIViewController {
    // 아이디, 비밀번호
    var id: String = ""
    var pw: String = ""
    
    // 1. Shevron SF Symbols (UIImage)
    private let shevron = UIImage(systemName: "chevron.backward")
    
    // 2. TVING ID 로그인 문구
    private let guideLabel: UILabel = {
        let guideLabel = UILabel()
        guideLabel.text = "TVING ID 로그인"
        guideLabel.font = .systemFont(ofSize: 24)
        guideLabel.textColor = .white
        guideLabel.textAlignment = .center
        return guideLabel
    }()
    
    // 3. ID TextField
    private let idTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.placeholder = "아이디"
        idTextField.backgroundColor = UIColor(named: "textFieldbackground")
        return idTextField
    }()
    
    // 4. Password TextField
    private let pwTextField: UITextField = {
        let pwTextField = UITextField()
        pwTextField.placeholder = "비밀번호"
        pwTextField.backgroundColor = UIColor(named: "textFieldbackground")
        pwTextField.clearButtonMode = .whileEditing
        return pwTextField
    }()
    
    // 5. 로그인하기 버튼
    private let loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.layer.borderColor = UIColor(named: "tappedBorder")?.cgColor
        loginButton.backgroundColor = UIColor.black
        return loginButton
    }()
    
    // 6. 아이디 찾기 label
    private let idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.text = "아이디 찾기  "
        idLabel.font = .systemFont(ofSize: 12)
        idLabel.textColor = UIColor(named: "textColor")
        return idLabel
    }()
    
    // 7. 구분선
    private let lindLabel: UILabel = {
        let lindLabel = UILabel()
        lindLabel.text = "|"
        lindLabel.font = .systemFont(ofSize: 12)
        lindLabel.textColor = UIColor(named: "textFieldbackground")
        return lindLabel
    }()
    
    // 8. 비밀번호 찾기 label
    private let pwLabel: UILabel = {
        let pwLabel = UILabel()
        pwLabel.text = "   비밀번호 찾기"
        pwLabel.font = .systemFont(ofSize: 12)
        pwLabel.textColor = UIColor(named: "textColor")
        return pwLabel
    }()
    
    // 9. 아직 계정이 없으신가요?
    private let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.text = "아직 계정이 없으신가요?"
        questionLabel.font = .systemFont(ofSize: 10)
        questionLabel.textColor = UIColor(named: "textFieldbackground")
        return questionLabel
    }()
    

}
