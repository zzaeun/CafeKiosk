//
//  FeatMenuView.swift
//  CafeKiosk
//
//  Created by 이정은 on 9/18/25.
//

import UIKit
import SnapKit

// 메뉴 나타내는 뷰
class FeatMenuView: UIView {
    
    // 메뉴 (사진, 이름, 가격)
    func menuView(item: FeatMenuItem) -> UIStackView {
        
        // 배경 동그라미
        let circleView = UIView()
        circleView.backgroundColor = UIColor(red: 243/255, green: 240/255, blue: 233/255, alpha: 1)
        circleView.layer.cornerRadius = 50
        
        circleView.snp.makeConstraints {
            $0.width.height.equalTo(100)
        }
        
        // 이미지
        let imageView = UIImageView()
        imageView.image = UIImage(named: item.image)
        imageView.contentMode = .scaleAspectFit
        circleView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(65)
        }
        
        // 타이틀
        let titleLabel = UILabel()
        titleLabel.text = item.title
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
    
    // 메뉴 3개를 Hstack으로 묶기
    func menuHstack(items: [FeatMenuItem]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        
        items.forEach { stackView.addArrangedSubview(menuView(item: $0)) }
            return stackView
        
    }
}
#Preview{
    ViewController()
}
