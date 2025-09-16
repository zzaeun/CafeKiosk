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
//    let segmentedControl: UISegmentedControl = {
//        let category = UISegmentedControl(items: ["Drink", "Food", "Products"])
//        category.translatesAutoresizingMaskIntoConstraints = false
//        return category
//    }()
//    let Drink: UIView = {
//        let view = UIView()
//        view.backgroundColor = .green
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        setConstraints()
    }

    func configureUI() {
        [appTitleLabel].forEach {
            view.addSubview($0)
        }
        
        // appTitleLabel 디자인
        appTitleLabel.text = "Appsoulte"
        appTitleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        appTitleLabel.textColor = .black

    }
    
    func setConstraints() {
        
        // appTitleLabel 위치
        appTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalToSuperview().offset(87)
        }
    }

}
