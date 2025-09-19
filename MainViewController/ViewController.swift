
import UIKit
import SnapKit
import Foundation

class ViewController: UIViewController {
    @DarkModeSetting var isDarkModeEnabled: Bool
    
    // 주문 버튼 뷰
    let buttonView = FeatButtonView()
    // 주문 내역을 표시하는 뷰
    let orderView = FeatOrderView()
    // 메뉴를 표시하는 뷰
    let menuView = FeatMenuView()
    let isDarkModeButton: UIButton = {
        let button = UIButton()
        
        
        
        return button
    }()
    
  
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
    
    func test(){
        print(menuView.menuView(item:))
    }
    //로딩 완료 후 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIForDarkMode()
        
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
        
        // 주문하기 버튼 액션 연결
        buttonView.orderButton.addTarget(self, action: #selector(orderTapped), for: .touchUpInside)
        buttonView.cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        
        
    }
    
    // 뷰 설정
    func configuerView() {
        [appTitleLabel, category, drinkHstack, foodHstack, productHstack, orderView].forEach {
            view.addSubview($0)
        }
        
        view.addSubview(isDarkModeButton)
        
        view.addSubview(buttonView)
        
        
    }
    
    //UI설정
    func setupUI(){
        // appTitleLabel 디자인
        appTitleLabel.text = "Appsoulte"
        appTitleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        
        // segementedContorl 디자인
        category.selectedSegmentTintColor = UIColor(red: 0/255, green: 112/255, blue: 74/255, alpha: 1.0)
        
        category.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
    }
    
    // 테이블 뷰 delegate, dataSource 설정
    func setupDelegates(){
        orderView.tableView.delegate = self
        orderView.tableView.dataSource = self
    }
    
    // 타겟 설정
    func setupTargets() {
        /// drink 뷰에 메뉴 0번부터 Tag 생성 및 Gesture 추가
        for index in 0..<drinkHstack.arrangedSubviews.count {
            let menuView = drinkHstack.arrangedSubviews[index]
            
            menuView.isUserInteractionEnabled = true
            menuView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(drinkMenuTapped(_:)))
            menuView.addGestureRecognizer(tapGesture)
        }
        /// food 뷰에 메뉴 0번부터 Tag 생성 및 Gesture 추가
        for index in 0..<foodHstack.arrangedSubviews.count {
            let menuView = foodHstack.arrangedSubviews[index]
            
            menuView.isUserInteractionEnabled = true
            menuView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(foodMenuTapped(_:)))
            menuView.addGestureRecognizer(tapGesture)
        }
        /// product뷰에 메뉴 0번부터 Tag 생성 및 Gesture 추가
        for index in 0..<productHstack.arrangedSubviews.count {
            let menuView = productHstack.arrangedSubviews[index]
            
            menuView.isUserInteractionEnabled = true
            menuView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(productMenuTapped(_:)))
            menuView.addGestureRecognizer(tapGesture)
        }
        
        // 다크모드 버튼 타겟 설정
        isDarkModeButton.addTarget(self, action: #selector(darkModeTapped), for: .touchUpInside)
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
        
        // 버튼 뷰 위치
        buttonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(12)
            make.height.equalTo(60)
        }
        
        
        
        // 다크모드 버튼 위치
        isDarkModeButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().inset(18)
            make.width.height.equalTo(40)
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
    
    // 주문하기 버튼
    @objc func orderTapped() {
        let hasMenu = orders.values.contains { $0.quantity > 0 }
        
        if !hasMenu {
            let failAlert = UIAlertController(title: "주문실패", message: "주문할 메뉴가 없습니다. \n메뉴를 선택해주세요!", preferredStyle: .alert)
            failAlert.addAction(UIAlertAction(title: "확인", style: .default))
            present(failAlert, animated: true)
            return
        }
        let alert = UIAlertController(title: "주문하기", message: "주문을 완료하시겠습니까?", preferredStyle: .alert)
        
        // 주문하기 "네" 버튼
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            
            self.orders.removeAll()
            self.orderView.tableView.reloadData()
            self.orderView.totalMenuCount.text = "총 0개"
            self.orderView.totalMenuPrice.text = "0원"
            
            let thankYouAlert = UIAlertController(title: "주문완료", message: "주문이 완료되었습니다!", preferredStyle: .alert)
            thankYouAlert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(thankYouAlert, animated: true)
        }
        
        let noAction = UIAlertAction(title: "아니오", style: .destructive)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
        
    
        }
    
    // 주문취소 버튼
    @objc func cancelTapped() {
        
        let alert = UIAlertController(title: "주문취소", message: "주문 내역을 모두 삭제하시겠습니까?", preferredStyle: .alert)
     
        // 주문취소 "네" 버튼
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            
            self.orders.removeAll()
            self.orderView.tableView.reloadData()
            self.orderView.totalMenuCount.text = "총 0개"
            self.orderView.totalMenuPrice.text = "0원"
            
            let deleteAlert = UIAlertController(title: "삭제 완료", message: "주문 내역이 모두 삭제되었습니다!", preferredStyle: .alert)
            deleteAlert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(deleteAlert, animated: true)
        }
        
        // "아니오" 누르면 아무일도 안 일어나용
        let noAction = UIAlertAction(title: "아니오", style: .destructive)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
        
        
        
        
        
    }
    
}

    
    
    
    
    #Preview{
        ViewController()
    }
    

