import UIKit
import SnapKit
import Then

final class CarrotTableViewCell: UITableViewCell {
    
    //데이터 정보는 가져오는 데이터에 따라 바뀌므로 초기화 작업 x
    private lazy var carrotImage = UIImageView()
    private let productLabel = UILabel()
    private let placeLabel = UILabel()
    private let timeLabel = UILabel()
    private let reservationLabel = UILabel()
    private let priceLabel = UILabel()
    private let horizontalStackView = UIStackView()
    
    // 테이블 뷰 셀 초기화 작업
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        
        separatorInset.left = 0
        
        selectionStyle = .none
        
        carrotImage.do {
            $0.makeRounded(radius: 5)
        }
        
        productLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        
        placeLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        timeLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        reservationLabel.do {
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 11)
            $0.makeRounded(radius: 3)
        }
        
        priceLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 13)
        }
        
        horizontalStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 5
        }
    }
    
    func setLayout() {
        
        // 이미지, 상품명라벨, 장소라벨, 시간라벨, (예약라벨/가격라벨)을 보여줄 뷰를 넣어줌
        // contentView안에 넣어주어야한다 --> tableview는 cell 내부의 subview를 contentView를 통해 관리해주기 때문
        [carrotImage, productLabel, placeLabel,
         timeLabel, horizontalStackView]
            .forEach { contentView.addSubview($0) }
        
        // 예약라벨/가격라벨을 하나로 묶어 horizontalStackView에 넣어준다
        // enum == .clear인 경우에는 이들이 안보이게 별도 처리를 해주어야하므로 별도의 뷰에 집어넣어준다
        // (isHidden 속성을 이용하면 쉽게 없애줄 수 있다)
        [reservationLabel, priceLabel]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        
        carrotImage.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        productLabel.snp.makeConstraints {
            $0.leading.equalTo(carrotImage.snp.trailing).offset(14)
            $0.top.equalToSuperview().inset(10)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(productLabel.self)
            $0.top.equalTo(productLabel.snp.bottom).offset(6)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(placeLabel.snp.trailing).offset(3)
            $0.top.equalTo(placeLabel.self)
        }
        
        reservationLabel.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(50)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.leading.equalTo(placeLabel.self)
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.height.equalTo(30)
        }
    }
    
    // 거래 상태에 따른 label의 텍스트 값 설정
    func configureCell(_ carrot: Carrot) {
        
        switch carrot.tradeStatus {
        case .reservation:
            self.reservationLabel.text = "예약중"
        case .completed:
            self.reservationLabel.text = "거래완료"
        case .shared:
            self.reservationLabel.text = "나눔완료"
        case .clear:
            self.reservationLabel.text = ""
        }
        
        carrotImage.image = carrot.image
        productLabel.text = carrot.product
        placeLabel.text = carrot.place
        timeLabel.text = carrot.time
        
        reservationLabel.text = carrot.tradeStatus.title
        reservationLabel.backgroundColor = carrot.tradeStatus.backgroundColor
        
        reservationLabel.isHidden = carrot.tradeStatus == .clear
        
        var price = String(carrot.price)
        
        if price.count > 3 {
            price.insert(",", at: price.index(price.endIndex, offsetBy: -3))
        }
        priceLabel.text = price + "원"
    }
}
