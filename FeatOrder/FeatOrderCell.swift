import Foundation
import UIKit

class FeatOrderCell: UITableViewCell{
    static let identifier = "FeatOrderCell"
    
    let dataLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(dataLabel)
    }
    
    func configureTableView(with data: String){
        self.dataLabel.text = data
    }
}
