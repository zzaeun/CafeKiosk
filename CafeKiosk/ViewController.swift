
import UIKit

class ViewController: UIViewController {
    let orderContainerView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .clear
        return uiView
    }()
    
    let menuView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .clear
        return uiView
    }()
    
    let featOrderVC = FeatOrderViewControll()
    let featMenuVC = FeatMenuViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
        addFeatOrderViewController()
        addFeatMenuViewController()
    }
    func setupLayout() {
        view.addSubview(orderContainerView)
        view.backgroundColor = .clear
        
        orderContainerView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(400)
        }
        
        view.addSubview(menuView)
        view.backgroundColor = .clear
        menuView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
        

    }
    
    func addFeatMenuViewController() {
        addChild(featMenuVC)
        menuView.addSubview(featMenuVC.view)
        
        featMenuVC.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        featMenuVC.didMove(toParent: self)
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
