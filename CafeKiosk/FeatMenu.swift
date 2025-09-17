//
//  FeatMenu.swift
//  CafeKiosk
//
//  Created by 이정은 on 9/16/25.
//

import UIKit
import SnapKit

class FeatMenu: UIViewController {

    let appTitleLabel = UILabel()
    let category: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Drink", "Food", "Product"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    // 각 메뉴 스택 뷰를 lazy 프로퍼티로 선언
    lazy var drinkHstack = self.menuHstack(type: .drink)
    lazy var foodHstack = self.menuHstack(type: .food)
    lazy var productHstack = self.menuHstack(type: .product)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        setConstraints()
        
        drinkHstack.isHidden = false
        foodHstack.isHidden = true
        productHstack.isHidden = true
        
        category.addTarget(self, action: #selector(tappedSegmentedControl), for: .valueChanged)
    }

    func configureUI() {
        [appTitleLabel, category, drinkHstack, foodHstack, productHstack].forEach {
            view.addSubview($0)
        }
        
        // appTitleLabel 디자인
        appTitleLabel.text = "Appsoulte"
        appTitleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        appTitleLabel.textColor = .black

        // segementedContorl 디자인
        category.selectedSegmentTintColor = UIColor(red: 0/255, green: 112/255, blue: 74/255, alpha: 1.0)
        category.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    func setConstraints() {
        
        // appTitleLabel 위치
        appTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(87)
        }
        
        // SegmentedControl
        category.snp.makeConstraints{
            $0.top.equalTo(appTitleLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(370)
            $0.height.equalTo(32)
        }
        
        
        [drinkHstack, foodHstack, productHstack].forEach {
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(category.snp.bottom).offset(24)
            }
        }

    }

    func menu(Image: String, title: String) -> UIStackView {
        // 배경 동그라미
        let circleView = UIView()
        circleView.backgroundColor = UIColor(red: 243/255, green: 240/255, blue: 233/255, alpha: 1)
        circleView.snp.makeConstraints {
            $0.width.height.equalTo(100)
        }
        circleView.layer.cornerRadius = 50
        
        // 이미지
        let imageView = UIImageView()
        imageView.image = UIImage(named: Image)
        imageView.contentMode = .scaleAspectFit
        
        circleView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(65)
        }
        
        // 타이틀
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 12)
        titleLabel.numberOfLines =  0
        titleLabel.textAlignment = .center
        
        // VStack으로 정렬
        let Vstack = UIStackView(arrangedSubviews: [circleView, titleLabel])
        Vstack.axis = .vertical
        Vstack.alignment = .center
        Vstack.spacing = 10

        Vstack.snp.makeConstraints{
            $0.width.equalTo(105)
            $0.height.equalTo(150)
        }
        return Vstack
    }
    
    enum menuType {
        case drink, food, product
    }
    
    func menuHstack(type: menuType) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        
        
        // Drink
        switch type {
        case .drink:
            let drink1 = menu(Image: "아이스아메리카노", title: "아이스 아메리카노")
            let drink2 = menu(Image: "자몽허니블랙티", title: "자몽 허니 블랙티")
            let drink3 = menu(Image: "자바칩프라푸치노", title: "자바칩 프라푸치노")
            [drink1, drink2, drink3].forEach {
                stackView.addArrangedSubview($0)
            }
            
            // Food
        case .food:
            let food1 = menu(Image: "멜팅치즈베이컨토스트", title: "멜팅 치즈 \n베이컨 토스트")
            let food2 = menu(Image: "바게트소금빵", title: "바게트 소금빵")
            let food3 = menu(Image: "진한가나슈9레이어케이크", title: "진한 가나슈 9\n레이어 케이크")
            [food1, food2, food3].forEach {
                stackView.addArrangedSubview($0)
            }
            
            // Product
        case .product:
            let product1 = menu(Image: "별바당블렌드", title: "별바당 블렌드 250g")
            let product2 = menu(Image: "시그니처사이렌머그", title: "시그니처 사이렌\n머그 237ml")
            let product3 = menu(Image: "SS커넥티드콩코드텀블러", title: "SS 커넥티드\n콩코드 텀블러 591ml")
            [product1, product2, product3].forEach {
                stackView.addArrangedSubview($0)
            }

        }
        
        return stackView
        
    }
    
    @objc
    func tappedSegmentedControl(_ sender: UISegmentedControl) {
        // 모든 스택 뷰 숨기기
        drinkHstack.isHidden = true
        foodHstack.isHidden = true
        productHstack.isHidden = true
        
        // 선택된 스택만 보이게
        switch sender.selectedSegmentIndex {
        case 0:
            drinkHstack.isHidden = false
        case 1:
            foodHstack.isHidden = false
        case 2:
            productHstack.isHidden = false
        default:
            break
        }
    }
}
