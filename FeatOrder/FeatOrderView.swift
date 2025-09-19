
import Foundation
import UIKit

class FeatOrderView: UIView{

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.borderColor = UIColor(hex: 0x00704A).cgColor
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .clear
        tableView.register(FeatOrderCell.self, forCellReuseIdentifier: FeatOrderCell.identifier)
        return tableView
        
    }()
    
    let totalMenuCount: UILabel = {
        let count = UILabel()
        count.text = "총 0개"
        count.font = UIFont.boldSystemFont(ofSize: 16)
        return count
    }()
    
    let totalMenuPrice: UILabel = {
        let label = UILabel()
        label.text = "0원"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let orderAmount: UILabel = {
        let label = UILabel()
        label.text = "주문금액"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear // 배경색 설정
        configuerView()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuerView(){
        addSubview(tableView)
        addSubview(totalMenuCount)
        addSubview(orderAmount)
        addSubview(totalMenuPrice)
    }
    
    private func setupUI(){

        totalMenuCount.snp.makeConstraints { make in
            make.bottom.equalTo(tableView.snp.top).offset(-4)
            make.trailing.equalTo(tableView.snp.trailing).inset(4)
        }
        
        tableView.snp.makeConstraints { make in
            make.height.equalTo(160)
            make.width.equalTo(300)
            make.centerX.equalToSuperview()
        }
        orderAmount.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(24)
            make.leading.equalTo(tableView.snp.leading).inset(4)
        }
        totalMenuPrice.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(24)
            make.trailing.equalTo(tableView.snp.trailing).inset(16)
        }
    }
    
}
