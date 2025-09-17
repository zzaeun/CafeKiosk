import Foundation
import UIKit

extension FeatOrderViewControll: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeatOrderCell.identifier, for: indexPath) as? FeatOrderCell else {
            return .init()
        }
        
        let menuName = dataArray[indexPath.row]
        let menuPrice = orders[menuName] ?? 0
        cell.ConfigureTableView(nameData: menuName, priceData: menuPrice)
        cell.backgroundColor = .clear
        return cell
    }
    
    
    
}
