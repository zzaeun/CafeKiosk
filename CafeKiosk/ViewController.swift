
import UIKit
import SnapKit
import Foundation

class ViewController: UIViewController {
    
    let orderView = FeatOrderView()
    let menuView = FeatMenuView()

    var orders: [String: (price: Int, quantity: Int)] = [:] {
        didSet{
            updateTableUI()
        }
    }
    
    var dataArray: [String] = []
    
    lazy var drinkHstack = menuView.menuHstack(items: FeatMenuData.drink)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuerView()
        setupUI()

        setupDelegates()
        setupTargets()
        setupInitialData()
        
        print("DataArray: \(dataArray)")
        print("Orders: \(orders)")
        
    }
    func configuerView() {
        view.backgroundColor = .white
        view.addSubview(orderView)
        view.addSubview(drinkHstack)
        
        
        
    }
    
    func setupUI(){
        drinkHstack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        
        orderView.snp.makeConstraints { make in
            make.top.equalTo(drinkHstack.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
    func setupDelegates(){
        orderView.tableView.delegate = self
        orderView.tableView.dataSource = self
    }
    
    func setupTargets(){
        /// drink 뷰에 메뉴 0번부터 Tag 생성 및 Gesture 추가
        drinkHstack.arrangedSubviews.enumerated().forEach{
            (index, menuView) in
            menuView.isUserInteractionEnabled = true
            menuView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(drinkMenuTapped(_ :)))
            menuView.addGestureRecognizer(tapGesture)
        }
    }
    /// drink메뉴 탭 이벤트
    /// 이벤트 진행한 버튼의 tag값을 통해 식별함
    /// orders 딕셔너리에 menuName을 key로하는 데이터 확인
    /// 있으면 기존 값의 quantity 값을 1증가 후 갱신
    /// 없으면 menuPriced와 quantity가 1인 튜플을 생성하여 딕셔너리에 추가
    @objc func drinkMenuTapped(_ sender: UITapGestureRecognizer){
        guard let tappedView = sender.view else {return}
        
        let tappedIndex = tappedView.tag
        let selectredItem = FeatMenuData.drink[tappedIndex]
        let menuName = selectredItem.title
        let menuPrice = selectredItem.price
        
        if var existingOrderTuple = orders[menuName] {
            existingOrderTuple.quantity += 1
            orders[menuName] = existingOrderTuple
        } else {
            orders[menuName] = (price: menuPrice, quantity: 1)
        }
        print("orders[menuName]: \(orders[menuName])")
        print("orders: \(orders)")
        print("DataArray: \(dataArray)")
    }
    
    func setupInitialData() {
        
    }
    
    
}

#Preview{
    ViewController()
}

