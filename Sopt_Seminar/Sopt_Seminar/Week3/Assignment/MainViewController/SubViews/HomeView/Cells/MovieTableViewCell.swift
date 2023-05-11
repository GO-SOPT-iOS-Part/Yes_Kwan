//
//  MovieTableViewCell.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/10.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var datas: [Movie] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }

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
        contentView.addSubview(header)
        contentView.addSubview(linkBtn)
        contentView.addSubview(collectionView)
        
        header.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(22.5)
        }
        
        linkBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(header.snp.top)
            $0.height.equalTo(20)
            $0.centerY.equalTo(header.snp.centerY)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(linkBtn.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(146)
        }
    }
    
    // CollectionViewFlowLayOut 설정
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.minimumLineSpacing = 10.0
        flow.minimumInteritemSpacing = 10.0
        flow.itemSize = .init(width: 98, height: 146.0)
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
        view.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.className)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isPagingEnabled = true
        return view
    }()
    
    // 0. Header - "티빙에서 꼭 봐야하는 콘텐츠"
    private let header: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "티빙에서 꼭 봐야하는 콘텐츠"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    // 1. Header - "전체보기>"
    private let linkBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("전체보기 >", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.tintColor = UIColor(named: "darkest")
        return btn
    }()
}

extension MovieTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // CollectionView 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.datas.count
    }
    
    // 반환 cell 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.className, for: indexPath) as! MovieCollectionViewCell
        cell.setImage(datas[indexPath.row].url)
        return cell
    }
}

