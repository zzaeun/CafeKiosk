////
////  viewcontroller.swift
////  CafeKiosk
////
////  Created by 이정은 on 9/18/25.
////
//
//
//import UIKit
//import SnapKit
//
//class ViewController: UIViewController {
//    let menuView: UIView = {
//        let uiView = UIView()
//        uiView.backgroundColor = .white
//        return uiView
//    }()
//    
//    let featMenuVC = FeatMenuViewController()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setup()
//        addFeatMenuViewController()
//        
//    }
//    
//    func setup() {
//        view.addSubview(menuView)
//        view.backgroundColor = .blue
//        menuView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(400)
//        }
//    }
//    
//    func addFeatMenuViewController() {
//        addChild(featMenuVC)
//        menuView.addSubview(featMenuVC.view)
//        
//        featMenuVC.view.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//        featMenuVC.didMove(toParent: self)
//    }
//}
//
//#Preview {
//    ViewController()
//}
