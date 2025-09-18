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

    var orders: [String: (price: Int, quantity: Int)] = [:] {
        didSet{
            updateTotalCountAndReload()
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
 

    let tableView = UITableView()
    
    let totalMenuCount: UILabel = {
        let count = UILabel()
        count.text = "총 0개"
        return count
    }()
    let totalMenuPrice = UILabel()
    let orderAmount = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 12
        
        configureView()
        
        
    }
    
    
    func configureView(){
        view.addSubview(tableView)
        view.addSubview(menuButton)
        view.addSubview(totalMenuCount)
        view.addSubview(totalMenuPrice)
        view.addSubview(orderAmount)
        
        menuButton.snp.makeConstraints{make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.borderColor = UIColor(hex: 0x00704A).cgColor
        tableView.layer.borderWidth = 0.6
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .clear
        
        tableView.register(FeatOrderCell.self, forCellReuseIdentifier: FeatOrderCell.identifier)
        
        
        tableView.snp.makeConstraints{make in
            
            make.top.equalTo(menuButton.snp.bottom).offset(60)
            make.height.equalTo(160)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
        }
        menuButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        
        totalMenuCount.snp.makeConstraints{make in
            make.bottom.equalTo(tableView.snp.top).offset(-4)
            totalMenuCount.font = UIFont.boldSystemFont(ofSize: 16)
            make.trailing.equalTo(tableView.snp.trailing).inset(4)
            
        }
        totalMenuPrice.snp.makeConstraints{make in
            make.top.equalTo(tableView.snp.bottom).offset(24)
            totalMenuPrice.text = "0원"
            totalMenuPrice.font = UIFont.boldSystemFont(ofSize: 16)
            make.trailing.equalTo(tableView.snp.trailing).inset(16)
        }
        orderAmount.snp.makeConstraints{make in
            make.top.equalTo(tableView.snp.bottom).offset(24)
            orderAmount.text = "주문금액"
            orderAmount.font = UIFont.boldSystemFont(ofSize: 16)
            make.leading.equalTo(tableView.snp.leading).inset(4)
        }
    }
    
}
#Preview{
    ViewController()
}
