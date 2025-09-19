
import UIKit
import SnapKit
import Foundation

class ViewController: UIViewController {
    @DarkModeSetting var isDarkModeEnabled: Bool
    func updateUIForDarkMode() {
        if isDarkModeEnabled {
            view.backgroundColor = .black
            appTitleLabel.textColor = .white
            isDarkModeButton.setImage(UIImage(named: "lightMode"),for: .normal)
            
            //TableViewCell 다크 모드
            orderView.tableView.reloadData()
            //주문 내역 다크모드
            orderView.totalMenuCount.textColor = .white
            orderView.totalMenuPrice.textColor = .white
            orderView.orderAmount.textColor = .white
        }
        
        else {
            view.backgroundColor = .white
            appTitleLabel.textColor = .black
            isDarkModeButton.setImage(UIImage(named: "darkmode"),for: .normal)
            
            //TableViewCell 라이트 모드
            orderView.tableView.reloadData()
            //주문 내역 라이트모드
            orderView.totalMenuCount.textColor = .black
            orderView.totalMenuPrice.textColor = .black
            orderView.orderAmount.textColor = .black

        }
    }

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
    }
    
    // 뷰 설정
    func configuerView() {
        [appTitleLabel, category, drinkHstack, foodHstack, productHstack, orderView].forEach {
            view.addSubview($0)
        }
        
        view.addSubview(isDarkModeButton)
        
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
        
        // 다크모드 버튼 위치
        isDarkModeButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().inset(18)
            make.width.height.equalTo(40)
        }
    }
    
    // 다크모드 버튼 선택
    @objc func darkModeTapped(_ sender: UIButton){
        print("버튼탭")
        isDarkModeEnabled.toggle()
        
        updateUIForDarkMode()
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

