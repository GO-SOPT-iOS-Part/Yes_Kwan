//
//  MainViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/03.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // SubViews
    private let homeViewController = HomeViewController()
    private let realTimeViewController = RealTimeViewController()
    private let tvViewController = TVViewController()
    private let movieViewController = MovieViewController()
    private let paramountViewController = ParamountViewController()
    
    // 1. BarleftButton
    lazy private var leftButton: UIBarButtonItem = {
        let leftBtn = UIBarButtonItem(image: UIImage(named: "logo_tving")?.resized(toWidth: 99), style: .plain, target: self, action: #selector(scrollUp))
        leftBtn.tintColor = .white
        return leftBtn
    }()
    
    // 2.1 미로그인 시
    lazy private var loginBtn: UIBarButtonItem = {
        let rightBtn = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(gotoLogIn))
        rightBtn.tintColor = .white
        return rightBtn
    }()
    
    // 2.2 로그인 시
    lazy private var myPageBtn: UIBarButtonItem = {
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(gotoMyPage))
        rightBtn.tintColor = .white
        return rightBtn
    }()
    
    // 3. Segmented Control
    private let segmentedControl: UISegmentedControl = {
        let control = SegmentControl(items: ["홈", "실시간", "TV", "영화", "파라마운트+"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.sizeToFit()
        return control
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayOut()
        setSegment()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "logo_tving")?.resized(toWidth: 99), style: .plain, target: self, action: #selector(scrollUp))
        self.navigationItem.leftBarButtonItem = leftButton
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 로그인 여부에 따라 다른 rightBarButton이 보이게끔 해주기
        if UserDefaults.standard.string(forKey: "loginState") == "logIn" {
            self.navigationItem.rightBarButtonItem = myPageBtn
        } else {
            self.navigationItem.rightBarButtonItem = loginBtn
        }
    }
    
    
    @objc func indexChanged(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 0:
            realTimeViewController.view.isHidden = true
            homeViewController.view.isHidden = false
            tvViewController.view.isHidden = true
            movieViewController.view.isHidden = true
            paramountViewController.view.isHidden = true
        case 1:
            realTimeViewController.view.isHidden = false
            homeViewController.view.isHidden = true
            tvViewController.view.isHidden = true
            movieViewController.view.isHidden = true
            paramountViewController.view.isHidden = true
        case 2:
            realTimeViewController.view.isHidden = true
            homeViewController.view.isHidden = true
            tvViewController.view.isHidden = false
            movieViewController.view.isHidden = true
            paramountViewController.view.isHidden = true
        case 3:
            realTimeViewController.view.isHidden = true
            homeViewController.view.isHidden = true
            tvViewController.view.isHidden = true
            movieViewController.view.isHidden = false
            paramountViewController.view.isHidden = true
        default:
            realTimeViewController.view.isHidden = true
            homeViewController.view.isHidden = true
            tvViewController.view.isHidden = true
            movieViewController.view.isHidden = true
            paramountViewController.view.isHidden = false
        }
        
    }
}

extension MainViewController {
    func setStyle() {
        view.backgroundColor = .black
    }
    
    func setLayOut() {
        
        [homeViewController.view, realTimeViewController.view, tvViewController.view, movieViewController.view, paramountViewController.view, segmentedControl].forEach {
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            homeViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            homeViewController.view.bottomAnchor.constraint(equalTo: view.topAnchor),
            homeViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            realTimeViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            realTimeViewController.view.bottomAnchor.constraint(equalTo: view.topAnchor),
            realTimeViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            realTimeViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tvViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            tvViewController.view.bottomAnchor.constraint(equalTo: view.topAnchor),
            tvViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tvViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            movieViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            movieViewController.view.bottomAnchor.constraint(equalTo: view.topAnchor),
            movieViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            paramountViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            paramountViewController.view.bottomAnchor.constraint(equalTo: view.topAnchor),
            paramountViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            paramountViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    
        segmentedControl.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
    
    func setSegment() {
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white,
              .font: UIFont.systemFont(ofSize: 11, weight: .medium)], for: .normal)
        self.segmentedControl.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 11, weight: .semibold)
            ],
            for: .selected
        )
        self.segmentedControl.selectedSegmentIndex = 0
        
        realTimeViewController.view.isHidden = true
        homeViewController.view.isHidden = false
        tvViewController.view.isHidden = true
        movieViewController.view.isHidden = true
        paramountViewController.view.isHidden = true
        
        self.segmentedControl.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
    }
    
    @objc
    func gotoMyPage() {
        let myPageViewController = MyPageViewController()
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
    
    @objc
    func scrollUp() {
        print(#function)
    }
    
    @objc
    func gotoLogIn() {
        let loginViewController = LogInViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}

