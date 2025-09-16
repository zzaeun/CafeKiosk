import Foundation
import UIKit

extension FeatOrderViewControll: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeatOrderCell.identifier, for: indexPath) as? FeatOrderCell else {
            return .init()
        }
        
        let data = datas[indexPath.row]
        cell.configureTableView(with: data)
        return cell
    }
    
    
    
}
