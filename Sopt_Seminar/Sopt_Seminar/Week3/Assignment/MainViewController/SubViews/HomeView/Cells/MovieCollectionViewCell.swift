//
//  MovieCollectionViewCell.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/10.
//

import UIKit
import SnapKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    // 2. 영화 이미지 뷰
    private let poster: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    // 3. init
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayOut()
    }
    
    // 4. 레이아웃 설정
    private func setLayOut() {
        
        contentView.addSubview(poster)
    
        poster.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    // 5. 이미지 설정
    func setImage(_ name: String) {
        poster.kf.setImage(with: URL(string: name))
    }
}
