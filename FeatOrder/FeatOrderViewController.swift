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
    let datas = ["1","2","3","4","5"]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    
    func configureView(){
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FeatOrderCell.self, forCellReuseIdentifier: FeatOrderCell.identifier)
        
        tableView.snp.makeConstraints{make in
            make.center.equalToSuperview()
        }

    }
    
}
#Preview{
    FeatOrderViewControll()
}
