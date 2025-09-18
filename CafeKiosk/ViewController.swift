
//
//  ViewController.swift
//  CafeKiosk
//
//  Created by 이정은 on 9/16/25.
//

import UIKit

class ViewController: UIViewController {
    let orderContainerView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        return uiView
    }()
    
    let featOrderVC = FeatOrderViewControll()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
        addFeatOrderViewController()
    }
    func setupLayout() {
        view.addSubview(orderContainerView)
        view.backgroundColor = .yellow
        orderContainerView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(400)
        }
    }
    private func addFeatOrderViewController() {
        // 부모에게 자식 뷰 컨트롤러를 추가
        addChild(featOrderVC)
        // 자식 뷰 컨트롤러의 View를 컨테이너 뷰 추가
        orderContainerView.addSubview(featOrderVC.view)
        
        featOrderVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
            
        }
        featOrderVC.didMove(toParent: self)
        
    }
}
#Preview{
    ViewController()
}
