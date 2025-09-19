import Foundation
import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController {
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "스타벅스_로고")
        image.layer.opacity = 0
        return image
    }()
    let textLabel: UILabel = {
        let text = UILabel()
        text.text = ""
        text.textColor = .white
        text.font = UIFont.boldSystemFont(ofSize: 50)
        text.layer.opacity = 0.5
        text.textAlignment = .center
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: 0x00704A)
        configureUI()
        setConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startImageFadeInAnimation()
    }
    func configureUI() {
        view.addSubview(imageView)
        view.addSubview(textLabel)
    }
    func setConstraints() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(120)
        }
        
        textLabel.snp.makeConstraints{
            $0.bottom.equalTo(imageView.snp.top).offset(-30)
            $0.centerX.equalToSuperview()
            
        }
    }
    
    func startImageFadeInAnimation() {
        UIView.animate(withDuration: 2.0, animations: {
            self.imageView.alpha = 1.0
        }, completion: { finished in
            if finished {
                self.typingAnimation()
            }
        })
    }
    
    func typingAnimation(){
        let text = "Appsoulte"
        var charIndex = 0.0
        
        for letter in text{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false){
                (timer) in self.textLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
}
#Preview {
    LaunchScreenViewController()
}
