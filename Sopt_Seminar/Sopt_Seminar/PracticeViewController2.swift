//
//  practice_2.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/01.
//

import Foundation
import UIKit

final class PracticeViewController2: UIViewController {
    var name: String?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    
    func dataBind(name: String) {
        nameLabel.text = name
    }
}

private extension PracticeViewController2 {
    
    func style() {
        view.backgroundColor = .white
    }
    
    @objc
    func backButtonTapped() {
        // 내비게이션 컨트롤러가 없으면
        if self.navigationController == nil {
            // dismiss
            self.dismiss(animated: true, completion: nil)
        // 내비게이션 컨트롤러가 있으면
        } else {
            // 내비게이션 컨트롤러에서 뷰를 pop 시켜준다
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}
