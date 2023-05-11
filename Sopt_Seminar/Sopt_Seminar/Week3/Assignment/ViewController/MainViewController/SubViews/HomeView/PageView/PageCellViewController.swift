//
//  PageCellViewController.swift
//  Sopt_Seminar
//
//  Created by 김응관 on 2023/05/09.
//

import UIKit

class PageCellViewController: UIViewController {
    
    private var index: Int = 0
    private var imgStr: String = "poster1"

    private var poster: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.poster.image = UIImage(named: imgStr)
    }

}
