//
//  FirstViewController_Ex1.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/08.
//

import Foundation
import UIKit
import SnapKit

final class FirstViewController_Ex1: UIViewController {
    
    var stack: Int = 0 {
        didSet {
            self.nameLabel.text = stack > 10 ? "10번 이상 눌렀네.. \(stack)" : "조금만 더 눌러바.. \(stack)"
        }
    }
    
    // UILabel - 클릭 횟수를 Count
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "누른횟수"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .black
        return label
    }()
    
    // UIButton - 다음 화면으로 이동하는 버튼
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음으로!", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(pushToSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    
}

private extension FirstViewController_Ex1 {
 
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        // 0. 만들어진 UIComponent들을 view에다가 추가
        [nameLabel, nextButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        // 1. constraint 정의 & superView와 중심을 맞춰줌
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(50)
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(100)
            $0.trailing.equalToSuperview().offset(-100)
            $0.top.equalTo(nameLabel.snp.bottom).offset(50)
            $0.height.equalTo(50)
        }
    }

    @objc
    func pushToSecondViewController() {
        
        // self의 타입자체가 옵셔널이므로 쓸데없는 메모리점유가 발생하지 않도록 하기 위해서 weak self를 사용함
        let secondViewController = SecondViewController_Ex2()
        secondViewController.completionHandler = { [weak self] text in
            guard let self else { return }
            
            if text < 10 && text >= 0 {
                self.nameLabel.text = "조금만 더 눌러바.. \(text)"
                secondViewController.count = text
            } else if text >= 10 {
                self.nameLabel.text = "10번 이상 눌렀네.. \(text)"
                secondViewController.count = text
            }
        }
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
