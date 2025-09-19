
import UIKit
import SnapKit
import Foundation

class ViewController: UIViewController {
    
    // 주문 내역을 표시하는 뷰
    let orderView = FeatOrderView()
    // 메뉴를 표시하는 뷰
    let menuView = FeatMenuView()

    
    // 메뉴title의 key값을 통해 가격과 수량을 저장하는 딕셔너리
    var orders: [String: (price: Int, quantity: Int)] = [:] {
        didSet{
            updateTableUI()
        }
    }
    
    // 테이블 뷰에 표시될 데이터 배열
    var dataArray: [String] = []
    
    // 음료 메뉴 수평 스택 뷰
    lazy var drinkHstack = menuView.menuHstack(items: FeatMenuData.drink)
    
    //로딩 완료 후 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        configuerView()
        setupUI()

        setupDelegates()
        setupTargets()

    }
    
    // 뷰 설정
    func configuerView() {
        view.backgroundColor = .white
        view.addSubview(orderView)
        view.addSubview(drinkHstack)
    }
    
    //UI설정
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
    
    // 테이블 뷰 delegate, dataSource 설정
    func setupDelegates(){
        orderView.tableView.delegate = self
        orderView.tableView.dataSource = self
    }
    
    // 메뉴 아이템 탭 제스처 타겟 설정
    func setupTargets() {
        /// drink 뷰에 메뉴 0번부터 Tag 생성 및 Gesture 추가
        for index in 0..<drinkHstack.arrangedSubviews.count {
            let menuView = drinkHstack.arrangedSubviews[index]

            menuView.isUserInteractionEnabled = true
            menuView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(drinkMenuTapped(_:)))
            menuView.addGestureRecognizer(tapGesture)
        }
    }
    
    // 음료 메뉴 탭 메서드
    @objc func drinkMenuTapped(_ sender: UITapGestureRecognizer){
        // 탭된 뷰 가져옴
        guard let tappedView = sender.view else {return}
        
        // 탭된 뷰의 태그를 통해 아이템 확인
        let tappedIndex = tappedView.tag
        let selectredItem = FeatMenuData.drink[tappedIndex]
        let menuName = selectredItem.title
        let menuPrice = selectredItem.price
        
        //order 딕셔너리에 이미 주문된 메뉴인지 확인
        if var existingOrderTuple = orders[menuName] {
            existingOrderTuple.quantity += 1
            orders[menuName] = existingOrderTuple
        } else {
            orders[menuName] = (price: menuPrice, quantity: 1)
        }
    }
    
}

#Preview{
    ViewController()
}

