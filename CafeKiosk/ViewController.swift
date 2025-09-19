
import UIKit
import SnapKit
import Foundation

class ViewController: UIViewController {
    
    // 주문 내역을 표시하는 뷰
    let orderView = FeatOrderView()
    // 메뉴를 표시하는 뷰
    let menuView = FeatMenuView()
    // 앱 제목
    let appTitleLabel = UILabel()
    // 메뉴 카테고리
    let category: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Drink", "Food", "Product"])
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    // 메뉴title의 key값을 통해 가격과 수량을 저장하는 딕셔너리
    var orders: [String: (price: Int, quantity: Int)] = [:] {
        didSet{
            updateTableUI()
        }
    }
    
    // 테이블 뷰에 표시될 데이터 배열
    var dataArray: [String] = []
    
    // 카테고리 별 메뉴 수평 스택 뷰
    lazy var drinkHstack = menuView.menuHstack(items: FeatMenuData.drink)
    lazy var foodHstack = menuView.menuHstack(items: FeatMenuData.food)
    lazy var productHstack = menuView.menuHstack(items: FeatMenuData.product)
    
    //로딩 완료 후 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        configuerView()
        setupUI()

        setupDelegates()
        setupTargets()
        setConstraints()
        
        // 처음 화면에 drinnk 메뉴들만 보이게
        drinkHstack.isHidden = false
        foodHstack.isHidden = true
        productHstack.isHidden = true
        
        category.addTarget(self, action: #selector(tappedSegmentedControl), for: .valueChanged)
    }
    
    // 뷰 설정
    func configuerView() {
        view.backgroundColor = .white
        [appTitleLabel, category, drinkHstack, foodHstack, productHstack, orderView].forEach {
            view.addSubview($0)
        }
    }
    
    //UI설정
    func setupUI(){
        // appTitleLabel 디자인
        appTitleLabel.text = "Appsoulte"
        appTitleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        appTitleLabel.textColor = .black
        
        // segementedContorl 디자인
        category.selectedSegmentTintColor = UIColor(red: 0/255, green: 112/255, blue: 74/255, alpha: 1.0)
        category.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)

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
    
    // 뷰 위치
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
        
        // 메뉴 3개 위치
        [drinkHstack, foodHstack, productHstack].forEach {
            $0.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(category.snp.bottom).offset(24)
            }
        }
        
        // 주문 뷰 위치
        orderView.snp.makeConstraints { make in
            make.top.equalTo(drinkHstack.snp.bottom).offset(200)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // 카테고리 메뉴 선택
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
    
}

#Preview{
    ViewController()
}

