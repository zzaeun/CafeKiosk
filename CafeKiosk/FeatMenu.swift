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
        let segmentedControl = UISegmentedControl(items: ["Drink", "Food", "Products"])
        
        return segmentedControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        setConstraints()
    }

    func configureUI() {
        [appTitleLabel, category].forEach {
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
    }

}
