//
//  SecondViewController_Closure.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/08.
//

import Foundation
import UIKit

final class SecondViewController_Closure: UIViewController {
    // ((String) -> (Void)) 타입을 Handler라는 이름의 타입으로 별칭선언
    typealias handler = ((String) -> (Void))
    
    // 클로저 타입의 프로퍼티를 선언
    var completionHandler: handler?
    
    var count: Int = 0
    
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
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

private extension SecondViewController_Closure {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }

    @objc
    func popSecondViewController() {
        guard let text = nameTextField.text else { return }
        completionHandler?(text)
        self.navigationController?.popViewController(animated: true)
    }
}
