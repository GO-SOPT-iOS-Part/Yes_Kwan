//
//  NicknameViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/21.
//

import Foundation
import UIKit
import SnapKit

class NicknameViewController: UIViewController {
    
    let containerHeight: CGFloat = (UIScreen.main.bounds.height) * 0.5
    
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    var currentContainerHeight: CGFloat = (UIScreen.main.bounds.height) * 0.5
    let dismissibleHeight: CGFloat = (UIScreen.main.bounds.height) * (1/3)
    
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
    
    // 4. Modal을 담는 뷰
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    // 5. 모달 상단의 어두운 화면 뷰
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.6
        return view
    }()
    
    // 6. Modal 내부에 들어갈 뷰
    lazy var containerStackView: UIStackView = {
        let spacing = UIView()
        let stackView = UIStackView(arrangedSubviews: [guideLabel, nickNameTextField, spacing, saveBtn])
        stackView.axis = .vertical
        stackView.spacing = 12.0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layOut()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseAction))
        dimmedView.addGestureRecognizer(tapGesture)
        setupPanGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePresentContainer()
    }
}

extension NicknameViewController {
    
    @objc func handleCloseAction() {
        animateDismissView()
    }
    
    func style() {
        view.backgroundColor = .clear
    }
    
    func layOut() {
        
        [dimmedView, containerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        [containerStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
        
        
        NSLayoutConstraint.activate([
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 55),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40),
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ])
        
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: containerHeight)
        
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view
            .bottomAnchor, constant: containerHeight)
        
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(62)
            $0.height.equalTo(50)
        }
        
        saveBtn.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        print("Pan gesture y offset: \(translation.y)")
        
        let isDraggingDown = translation.y > 0
        print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")
        
        let newHeight = currentContainerHeight - translation.y
        
        switch gesture.state {
        case .changed:
            if newHeight < containerHeight {
                containerViewHeightConstraint?.constant = newHeight
                view.layoutIfNeeded()
            }
        case .ended:
            if newHeight < dismissibleHeight {
                self.animateDismissView()
            }
            else if newHeight < containerHeight {                animateContainerHeight(containerHeight)
            }
            else if newHeight < UIScreen.main.bounds.height && isDraggingDown {
                animateContainerHeight(containerHeight)
            }
        default:
            break
        }
    }
    
    func setupPanGesture() {
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        // change to false to immediately listen on gesture movement
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    
//    func animateShowDimmedView() {
//        dimmedView.alpha = 0
//        UIView.animate(withDuration: 0.1) {
//            self.dimmedView.alpha = 0.6
//        }
//    }
    
    func animatePresentContainer() {
        // Update bottom constraint in animation block
        UIView.animate(withDuration: 0.4) {
            self.containerViewBottomConstraint?.constant = 0
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
    
    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            // Update container height
            self.containerViewHeightConstraint?.constant = height
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
            // Save current height
            currentContainerHeight = height
        }
    
    func animateDismissView() {
        // hide blur view
        dimmedView.alpha = 0.6
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
        // hide main view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.containerHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
}
