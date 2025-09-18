//
//  FeatButtonView.swift
//  CafeKiosk
//
//  Created by 김리하 on 9/18/25.
//

import UIKit
import SnapKit

class FeatButtonView: UIView {
    
    // 주문하기 버튼
    let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("주문하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0/255, green: 112/255, blue: 74/255, alpha: 1.0)
        button.layer.cornerRadius = 15 // 버튼 모서리 둥글게
        return button
        
    }()
    
    
    // 주문취소 버튼
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("주문취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15 // 테두리 각도(?)
        button.layer.borderWidth = 0.7 // 테두리 두께
        button.layer.borderColor = UIColor(
            red: 0/255, green: 112/255, blue: 74/255, alpha: 1.0).cgColor // 테두리 색상
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
    
        addSubview(orderButton)
        addSubview(cancelButton)

        
        
        orderButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide
            ).offset(-10)
            make.height.equalTo(40) // 높이는 40으로 설정했습니당

        }

        

        cancelButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(orderButton.snp.leading).offset(-16)
            make.bottom.equalTo(orderButton.snp.bottom)
            make.height.equalTo(orderButton.snp.height)
            make.width.equalTo(orderButton.snp.width)

        }

    }
    
    // 스토리 보드 막아버림
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
