
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
        
        
        cell.delegate = self
        cell.backgroundColor = .clear
        print("여기는 어떤가요? \(cell)")
        return cell
    }

}
