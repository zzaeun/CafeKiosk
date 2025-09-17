import Foundation
import UIKit

protocol FeatOrderCellDelegate: AnyObject{
    func quantityDidChange(for cell: FeatOrderCell, newQuantity: Int)
}

class FeatOrderCell: UITableViewCell{
    weak var delegate: FeatOrderCellDelegate?
    
    static let identifier = "FeatOrderCell"
    var unitPrice = 0
    let nameLabel = UILabel()
    let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        return label
    }()
    var priceLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        contentView.addSubview(amountLabel)
        amountLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        contentView.addSubview(plusButton)
        plusButton.snp.makeConstraints{make in
            make.leading.equalTo(amountLabel.snp.trailing)
            make.centerY.equalToSuperview()
        }
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        contentView.addSubview(minusButton)
        minusButton.snp.makeConstraints{make in
            make.trailing.equalTo(amountLabel.snp.leading)
            make.centerY.equalToSuperview()
        }
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    func ConfigureTableView(nameData name: String, priceData price: Int, amountCount count: Int){
        nameLabel.text = name
        self.unitPrice = price
        amountLabel.text = "\(count)"
        priceLabel.text = "\(price * count)"
        
    }
    
    @objc func plusButtonTapped(){
        guard let text = amountLabel.text, let result = Int(text) else {return}
        guard priceLabel.text != nil else {return}
        let newAmount = result +  1
        let totalprice =  unitPrice * newAmount
        amountLabel.text = "\(newAmount)"
        priceLabel.text = "\(totalprice)"
        delegate?.quantityDidChange(for: self, newQuantity: newAmount)
    }
    @objc func minusButtonTapped(){
        guard let text = amountLabel.text, let result = Int(text) else {return}
        guard priceLabel.text != nil else {return}
        let newAmount = result -  1
        let totalprice =  unitPrice * newAmount
        amountLabel.text = "\(newAmount)"
        priceLabel.text = "\(totalprice)"
        delegate?.quantityDidChange(for: self, newQuantity: newAmount)
    }
}

#Preview{
    FeatOrderViewControll()
}
