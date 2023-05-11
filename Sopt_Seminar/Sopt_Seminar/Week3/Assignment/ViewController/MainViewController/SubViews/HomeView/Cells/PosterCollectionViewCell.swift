//
//  PosterCollectionViewCell.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/09.
//

import UIKit
import SnapKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    // 1. 포스터 이미지 뷰
    private let poster: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    // 2. init
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayOut()
    }
    
    // 3. 레이아웃 설정
    private func setLayOut() {
        
        contentView.addSubview(poster)
        
        poster.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
    }
    
    // 4. 이미지 설정
    func setImage(_ name: String) {
        poster.image = UIImage(named: name)?.resized(withPercentage: 3.0)
    }
}
