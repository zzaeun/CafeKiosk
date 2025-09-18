//
//  FeatMenuViewController.swift
//  CafeKiosk
//
//  Created by 이정은 on 9/18/25.
//

import UIKit
import SnapKit

// 화면 로직
class FeatMenuViewController: UIViewController {

    let appTitleLabel = UILabel()
    let category: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Drink", "Food", "Product"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    // 각 메뉴 스택 뷰를 lazy 프로퍼티로 선언
    let menuView = FeatMenuView()
    
    lazy var drinkHstack = menuView.menuHstack(items: FeatMenuData.drink)
    lazy var foodHstack = menuView.menuHstack(items: FeatMenuData.food)
    lazy var productHstack = menuView.menuHstack(items: FeatMenuData.product)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        setConstraints()
        
        // 처음 화면에 drinnk 메뉴들만 보이게
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
