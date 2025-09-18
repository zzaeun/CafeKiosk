//
//  LaunchScreenViewController.swift
//  CafeKiosk
//
//  Created by 이정은 on 9/18/25.
//

import Foundation
import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController {
   
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0x00704A).cgColor
        configureUI()
        setConstraints()
    }

    func configureUI() {
        imageView.image = UIImage(named: "스타벅스_로고")
        view.addSubview(imageView)
    }
    
    func setConstraints() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(120)
        }
    }
    
}

#Preview {
    LaunchScreenViewController()
}
