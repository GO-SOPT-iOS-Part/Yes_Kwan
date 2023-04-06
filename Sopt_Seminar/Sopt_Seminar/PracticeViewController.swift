//
//  practice_1.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/01.
//

import Foundation
import UIKit

final class PracticeViewController: UIViewController {

    private let nameLabel: UILabel = {
        // UILabel 객체 생성
        let label = UILabel()
        // 텍스트 - 폰트 - 글자색 - 정렬방식 지정
        label.text = "이름이 무엇인가요?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    // 버튼을 사용할 때 인스턴스를 생성하게끔 하기 위하여 lazy var로 설정해줌
    private lazy var presentButton: UIButton = {
        // 버튼 객체 생성
        let button = UIButton()
        // 버튼제목, 배경색, 제목글자색 설정
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        // selector -> 함수를 직접 지정해서 실행할 때 사용함, 실행함수는 @objc를 달아줘야함
        button.addTarget(self,
                             action: #selector(pushButtonTapped),
                             for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
        // 텍스트필드 객체 생성
        let textField = UITextField()
        // placeholder, 테두리,
        textField.placeholder = "이름을 입력해주세요"
        // 글자 입력할 때 clear 버튼이 나오게 해주는 기능
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    
    // 화면 전환 코드
    func presentToSecondViewController() {
        let secondViewController = PracticeViewController2()
        // 모달 스타일 지정
        secondViewController.modalPresentationStyle = .fullScreen
        // 애니메이션 효과로 나타나게끔 설정
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController() {
        let secondViewController = PracticeViewController2()
        // 데이터 바인딩
        // 1. secondViewController.dataBind(name: nameTextField.text ?? "")
        // 2. if let을 통한 옵셔널 처리
        if let name = nameTextField.text {
            secondViewController.dataBind(name: name)
        }
        // 3. guard let을 통한 옵셔널 처리
        //guard let name = nameTextField.text else { return }
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    // 버튼이 눌렸을 때의 동작을 실행하는 함수들, 컴파일이 아닌 런타임시에 실행되는 동적인 함수들이다
    @objc
    func presentButtonTapped() {
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        pushToSecondViewController()
    }
}

private extension PracticeViewController {
    // 뷰의 배경색을 지정해준다
    func style() {
        view.backgroundColor = .white
    }
    
    // 오토레이아웃 코드
    func setLayout() {
        [nameLabel, nameTextField,
         presentButton, pushButton].forEach {
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
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}

