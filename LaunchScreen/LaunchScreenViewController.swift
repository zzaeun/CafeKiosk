
import Foundation
import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController{
    
    let centerLogo: UIImage = {
        guard let url = Bundle.main.url(forResource: "starbucksLogo", withExtension: "png", subdirectory: "LaunchScreenResources") else {
            print("tarbucksLogo.png 파일의 URL을 찾을 수 없습니다.")
            return UIImage()
        }
        
        guard let image = UIImage(contentsOfFile: url.path) else {
            print("URL 경로로부터 이미지를 생성할 수 없습니다.")
            return UIImage()
        }
        
        return image
    }()
    
    let logoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuerViews()
        setupUI()
    }
    
    private func configuerViews(){
        view.addSubview(logoImageView)
        logoImageView.image = centerLogo
        
    }
    
    private func setupUI(){
        
        logoImageView.snp.makeConstraints{make in
            make.center.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
    }
    
    
}
#Preview{
    LaunchScreenViewController()
}
