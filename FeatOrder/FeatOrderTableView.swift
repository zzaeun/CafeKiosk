
import Foundation
import UIKit

extension FeatOrderViewControll: UITableViewDelegate,UITableViewDataSource,FeatOrderCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeatOrderCell.identifier, for: indexPath) as? FeatOrderCell else {
            return UITableViewCell()
        }
        
        
        let menuName = dataArray[indexPath.row]
       
       
        if let orderTuple = orders[menuName] {

            cell.ConfigureTableView(nameData: menuName, priceData: orderTuple.price, amountCount: orderTuple.quantity)
        }
        cell.delegate = self
        cell.backgroundColor = .clear
        return cell
    }
    
    
    
}
