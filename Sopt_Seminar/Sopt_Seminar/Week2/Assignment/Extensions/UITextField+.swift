//
//  UITextField+.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/04/19.
//

import Foundation
import UIKit

extension UITextField {
    // Placeholder color set
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
    
    // textfield 좌측 패딩
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    // textfield 우측 패딩
    func addRightPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.whileEditing
    }
    
    // textfield 내부 버튼 생성/배치
    func textFieldBtn(_ flag: Int) {
        // 1. clear button -> 커스텀 타입으로 지정
        let image = UIImage(systemName: "x.circle")
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(image, for: .normal)
        clearButton.frame = CGRect(x: 0, y: 0, width: 45, height: 50)
        clearButton.tintColor = UIColor(named: "textColor")
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(UITextField.clear(sender:) ), for: .touchUpInside)
        self.addTarget(self, action: #selector(UITextField.displayClearButtonIfNeeded), for: .editingDidBegin)
        self.addTarget(self, action: #selector(UITextField.displayClearButtonIfNeeded), for: .editingChanged)
        
        // flag가 1 -> 비밀번호 텍스트필드
        // flag가 1이아님 -> 아이디 텍스트필드
        if flag == 1 {
            // 2. eye button -> 커스텀 타입으로 지정
            let eye = UIImage(systemName: "eye")
            let securityButton = UIButton(type: .custom)
            securityButton.setImage(eye, for: .normal)
            securityButton.tintColor = UIColor(named: "textColor")
            securityButton.contentMode = .scaleAspectFit
            securityButton.frame = CGRect(x: 40, y: 0, width: 45, height: 50)
            
            // 3. 버튼들을 담을 rightView 생성 및 버튼들 추가
            let container = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 50))
            container.addSubview(clearButton)
            container.addSubview(securityButton)
            
            // 4. 버튼들을 담은 임의의 UIView를 텍스트필드의 rightView로 지정 (편집중에만 보여지게 지정)
            self.rightView = container
        } else {
            let container = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 50))
            container.addSubview(clearButton)
            
            self.rightView = container
        }
        
        self.rightViewMode = .whileEditing
    }
    
    // clearbutton이 텍스트필드에서 필요한지 판별해주는 메서드
    @objc
    private func displayClearButtonIfNeeded() {
        self.rightView?.isHidden = (self.text?.isEmpty) ?? true
    }
    
    // textfield 상의 text를 clear 해주는 메서드
    @objc func clear(sender : AnyObject) {
        self.text = ""
        sendActions(for: .editingChanged)
    }
}
