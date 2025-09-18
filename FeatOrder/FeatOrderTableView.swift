
import Foundation
import UIKit

extension ViewController: UITableViewDelegate,UITableViewDataSource,FeatOrderCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection 호출됨, row 개수: \(dataArray.count)")
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeatOrderCell.identifier, for: indexPath) as? FeatOrderCell else {
            return UITableViewCell()
        }
        let menuName = dataArray[indexPath.row]
        guard let orderinfo = orders[menuName] else {return cell}

        cell.delegate = self
        cell.backgroundColor = .clear
        print("여기는 어떤가요? \(cell)")
        
        cell.ConfigureTableView(nameData: menuName, priceData: orderinfo.price, amountCount: orderinfo.quantity)
        
        return cell
    }

}
