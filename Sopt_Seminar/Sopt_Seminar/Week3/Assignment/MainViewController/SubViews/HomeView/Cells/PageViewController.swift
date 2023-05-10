//
//  PageViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/09.
//

import UIKit
import SnapKit

class PageViewController: UITableViewCell {
    
    // Poster 이미지 목록
    private var items: [String] = ["poster1", "poster2", "poster1", "poster2", "poster1"]
    
    // init
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayOut()
        separatorInset.left = 0
        selectionStyle = .default
        self.backgroundColor = .clear
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // layout setting + addSubView
    private func setLayOut() {
        contentView.addSubview(collectionView)
        contentView.addSubview(grayDot)
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(510)
        }
        
        grayDot.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(-30)
        }
    }
    
    // CollectionViewFlowLayOut 설정
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.minimumLineSpacing = 0.0
        flow.minimumInteritemSpacing = 0.0
        flow.itemSize = .init(width: UIScreen.main.bounds.width, height: 510.0)
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return flow
    }()
    
    // CollectionView 객체 생성
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero,
                                     collectionViewLayout: collectionViewFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.contentInset = .zero
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.className)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isPagingEnabled = true
        return view
    }()
    
    // UIPageControl 객체 생성
    private lazy var grayDot: UIPageControl = {
        let dot = UIPageControl()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.numberOfPages = items.count
        dot.hidesForSinglePage = true
        dot.currentPageIndicatorTintColor = .systemGray
        dot.pageIndicatorTintColor = .white
        return dot
    }()
    
}
    
extension PageViewController: UICollectionViewDelegate {
    // Dot 색깔 페이지에 맞게 바뀌게끔 해주는 함수
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        grayDot.currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension PageViewController: UICollectionViewDataSource {
    
    // CollectionView 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    // 반환 cell 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.className, for: indexPath) as! PosterCollectionViewCell
        
        cell.setImage(items[indexPath.row])
        return cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0))
    }
}
