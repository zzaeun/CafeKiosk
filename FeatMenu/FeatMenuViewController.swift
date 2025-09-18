
import UIKit
import SnapKit

// 화면 로직
class FeatMenuViewController: UIViewController {
    let featOrderViewControll = FeatOrderViewControll()
    
    let appTitleLabel = UILabel()
    let category: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Drink", "Food", "Product"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()

    // 각 메뉴 스택 뷰를 lazy 프로퍼티로 선언
    let menuView = FeatMenuView()
    
    lazy var drinkHstack = menuView.menuHstack(items: FeatMenuData.drink)
    lazy var foodHstack = menuView.menuHstack(items: FeatMenuData.food)
    lazy var productHstack = menuView.menuHstack(items: FeatMenuData.product)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        setConstraints()
        
        // 처음 화면에 drinnk 메뉴들만 보이게
        drinkHstack.isHidden = false
        foodHstack.isHidden = true
        productHstack.isHidden = true

        /// drink 뷰에 메뉴 0번부터 Tag 생성 및 Gesture 추가
        drinkHstack.arrangedSubviews.enumerated().forEach{
            (index, menuView) in
            menuView.isUserInteractionEnabled = true
            menuView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(drinkMenuTapped(_ :)))
            menuView.addGestureRecognizer(tapGesture)
        }
        /// food뷰에 메뉴 0번부터 Tag 생성 및 Gesture 추가
        foodHstack.arrangedSubviews.enumerated().forEach{
            (index, menuView) in
            menuView.isUserInteractionEnabled = true
            menuView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(featOrderViewControll.foodMenuTapped(_:)))
            menuView.addGestureRecognizer(tapGesture)
        }
        
        /// product뷰에 메뉴 0번부터 Tag 생성 및 Gesture 추가
        productHstack.arrangedSubviews.enumerated().forEach{
            (index, menuView) in
            menuView.isUserInteractionEnabled = true
            menuView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(productTapped(_ :)))
            menuView.addGestureRecognizer(tapGesture)
        }
        
        category.addTarget(self, action: #selector(tappedSegmentedControl), for: .valueChanged)
    }



    
    func configureUI() {
        [appTitleLabel, category, drinkHstack, foodHstack, productHstack].forEach {
            view.addSubview($0)
        }
        
        // appTitleLabel 디자인
        appTitleLabel.text = "Appsoulte"
        appTitleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        appTitleLabel.textColor = .black

        // segementedContorl 디자인
        category.selectedSegmentTintColor = UIColor(red: 0/255, green: 112/255, blue: 74/255, alpha: 1.0)
        category.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    func setConstraints() {
        
        // appTitleLabel 위치
        appTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(87)
        }
        
        // SegmentedControl
        category.snp.makeConstraints{
            $0.top.equalTo(appTitleLabel.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(370)
            $0.height.equalTo(32)
        }
        
        
        [drinkHstack, foodHstack, productHstack].forEach {
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(category.snp.bottom).offset(24)
            }
        }

    }
    

    
    @objc
    func tappedSegmentedControl(_ sender: UISegmentedControl) {
        // 모든 스택 뷰 숨기기
        drinkHstack.isHidden = true
        foodHstack.isHidden = true
        productHstack.isHidden = true
        
        // 선택된 스택만 보이게
        switch sender.selectedSegmentIndex {
        case 0:
            drinkHstack.isHidden = false
        case 1:
            foodHstack.isHidden = false
        case 2:
            productHstack.isHidden = false
        default:
            break
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
        
        if var existingOrderTuple = featOrderViewControll.orders[menuName] {
            existingOrderTuple.quantity += 1
            featOrderViewControll.orders[menuName] = existingOrderTuple
        } else {
            featOrderViewControll.orders[menuName] = (price: menuPrice, quantity: 1)
        }
        
        
        print("\(selectredItem.title) \(selectredItem.price)")
        print(featOrderViewControll.dataArray)
    }
    
    //food메뉴 탭 이벤트
//    @objc func foodMenuTapped(_ sender: UITapGestureRecognizer){
//        guard let tappedView = sender.view else {return}
//        
//        let tappedIndex = tappedView.tag
//        let selectredItem = FeatMenuData.food[tappedIndex]
//        let menuName = selectredItem.title
//        let menuPrice = selectredItem.price
//        
//        if var existingOrderTuple = featOrderViewControll.orders[menuName] {
//            existingOrderTuple.quantity += 1
//            featOrderViewControll.orders[menuName] = existingOrderTuple
//        } else {
//            featOrderViewControll.orders[menuName] = (price: menuPrice, quantity: 1)
//        }
//        print("\(selectredItem.title) \(selectredItem.price)")
//    }
    
    //product메뉴 탭 이벤트
    @objc func productTapped(_ sender: UITapGestureRecognizer){
        guard let tappedView = sender.view else {return}
        
        let tappedIndex = tappedView.tag
        let selectredItem = FeatMenuData.product[tappedIndex]
        let menuName = selectredItem.title
        let menuPrice = selectredItem.price
        if var existingOrderTuple = featOrderViewControll.orders[menuName] {
            existingOrderTuple.quantity += 1
            featOrderViewControll.orders[menuName] = existingOrderTuple
        } else {
            featOrderViewControll.orders[menuName] = (price: menuPrice, quantity: 1)
        }
        print("\(selectredItem.title) \(selectredItem.price)")
    }
}
#Preview{
    ViewController()
}
