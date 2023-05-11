//
//  HomeViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/09.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var movieList: [Result] = []
    
    // 1. 테이블뷰 생성
    private let tableView: UITableView = {
        let table = UITableView()
        table.allowsSelection = false
        table.backgroundColor = .black
        table.separatorStyle = .none
        table.bounces = true
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        table.contentInset = .zero
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // 2. 영화 정보 API 받아오는 함수
    private func getMovie() {
        MovieService.shared.getInfo(key: "75df104409445c36a314b12eb0aa5fdb", language: "ko", adult: false, video: false, page: 1) { response in
            
            switch response {
            case .success(let data):
                guard let data = data as? Welcome else { return }
                self.movieList = data.results
            default:
                return
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayOut()
        
        getMovie()
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        
        tableView.do {
            $0.register(PageViewController.self, forCellReuseIdentifier: PageViewController.className)
            $0.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.className)
            
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setLayOut() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PageViewController.className, for: indexPath) as? PageViewController else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.className, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
            return cell
        }
    }
}

extension HomeViewController: getMovieData {
    func getMovieData() -> [Result] {
        return movieList
    }
}
