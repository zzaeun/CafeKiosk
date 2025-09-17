import Foundation

import UIKit
import SnapKit

/// 상품 버튼을 눌렀을때 (UIButton) 여기서 SetTitle이랑 가격(UILabel)을 불러온다.
/// SetTitle은 좌측에 배치하고 가격은 우측에 배치한다.
/// 정중앙에 숫자(1)를 표시하고 각 좌, 우에 [-] [+]버튼을 배치한다
/// [-] [+]버튼을 클릭하면 불러온 정중앙의 숫자에 + 1 혹은 - 1 더한값으로 변경한다.
/// 정중앙에 숫자는 음수를 나타낼 수 없다. 0이면 삭제하는게 처리방식이 더 좋을듯함
/// TableView를 활용하여 cell을 추가하며 cell에는 SetTitle 가격 정중앙에 숫자(1) [-] [+] 을 배치한다.
class FeatOrderViewControll: UIViewController{

    let menuItems: [(name: String, price: Int)] = [
        (name: "아메리카노",price: 4500),
        (name: "카페라떼",price: 4000)
    ]
    //set은 순서가 없기 떄문에 indexPath.row를 사용할 수 없어 Array로 변환하기
    var orders: [String: Int] = [:] {
        // datas Set이 변경될 때마다 이 코드가 실행
        // didSet은 새 값이 저장된 직후에 호출
        didSet{
            // Set을 Array로 변환 정렬시키기
            dataArray = orders.keys.sorted()
            
            tableView.reloadData()
        }
    }

    var dataArray: [String] = []
    
    lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle(menuItems[0].name, for: .normal)
        button.tag = 0
        button.layer.cornerRadius = 13
        button.backgroundColor = .lightGray
        return button
    }()
    
    lazy var menuButton1: UIButton = {
        let button = UIButton()
        button.setTitle(menuItems[1].name, for: .normal)
        button.tag = 1
        button.layer.cornerRadius = 13
        button.backgroundColor = .lightGray
        return button
    }()
    
    @objc func menuTapped(sender: UIButton){
        let menuID = sender.tag
        
        let selectMenu = menuItems[menuID]
        orders[selectMenu.name] = selectMenu.price
    }
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 12
        
        configureView()
        
        
    }
    
    
    func configureView(){
        view.addSubview(tableView)
        view.addSubview(menuButton)
        view.addSubview(menuButton1)
        menuButton.snp.makeConstraints{make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.centerX.equalToSuperview()
        }
        menuButton1.snp.makeConstraints{make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.borderColor = UIColor(hex: 0x00704A).cgColor
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .clear
        
        tableView.register(FeatOrderCell.self, forCellReuseIdentifier: FeatOrderCell.identifier)
        
        
        tableView.snp.makeConstraints{make in
            make.top.equalTo(menuButton.snp.bottom).offset(60)
            make.height.equalTo(200)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
            
            
        }
        menuButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        menuButton1.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
    }
    
}
#Preview{
    FeatOrderViewControll()
}
