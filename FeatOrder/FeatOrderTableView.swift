
import Foundation
import UIKit

extension ViewController: UITableViewDelegate,UITableViewDataSource,FeatOrderCellDelegate {
    
    // 테이블 뷰 표시할 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection 호출됨 row 개수: \(dataArray.count)")
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeatOrderCell.identifier, for: indexPath) as? FeatOrderCell else {
            return UITableViewCell()
        }
        
        // indexPath 메뉴 이름을 dataArray에서 가져옴
        let menuName = dataArray[indexPath.row]
        // order 딕셔너리에서 메뉴 이름에 해당하는 정보 가져옴
        guard let orderinfo = orders[menuName] else {return cell}

        cell.delegate = self
        cell.backgroundColor = .clear
        
        // 셀의 UI 구성
        cell.ConfigureTableView(nameData: menuName, priceData: orderinfo.price, amountCount: orderinfo.quantity)
        
        if isDarkModeEnabled {
            // 다크 모드일 때의 셀 디자인
            cell.nameLabel.textColor = .white
            cell.plusButton.setTitleColor(.white, for: .normal)
            cell.minusButton.setTitleColor(.white, for: .normal)
            cell.priceLabel.textColor = .white
            cell.amountLabel.textColor = .white
            //cell.backgroundColor = .darkGray
        } else {
            // 라이트 모드일 때의 셀 디자인
            cell.nameLabel.textColor = .black
            cell.plusButton.setTitleColor(.black, for: .normal)
            cell.minusButton.setTitleColor(.black, for: .normal)
            cell.priceLabel.textColor = .black
            cell.amountLabel.textColor = .black
            //cell.backgroundColor = .white
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
