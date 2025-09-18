
import Foundation
import UIKit

extension ViewController{
    
    
    /// FeatOrderCell의 protocol의 함수.
    /// +, - 버튼을 눌러 수량이 변경되었을 때 호출
    ///tableView.indexPath(for: cell) 을 통해 탭한 셀의 indexPath을 확인
    ///해당 셀의 수량이 0이라면 삭제
    ///0이 아니라면 newQuantity수량을 orders[menuName]?.quantity에 업데이트
    func quantityDidChange(for cell: FeatOrderCell, newQuantity: Int) {
        guard let indexPath = orderView.tableView.indexPath(for: cell) else { return }
        let menuName = dataArray[indexPath.row]

        if newQuantity == 0 {
            orders.removeValue(forKey: menuName)
        } else {
            orders[menuName]?.quantity = newQuantity
        }
    }
    
    /// UI변경 메소드
    ///totalQuantity을 통해 orders.values에 있는 모든 수량을 체크 후 합산
    ///totalPrice는 금액 합산
    ///이후 각 프로퍼티에 해당하는 텍스트 업데이트
    ///순서가 변경되지 않도록 orders.keys값을 가져와 dataArray를 갱신
    ///이후 reloadData를 통해 셀 재생성
    func updateTableUI() {
        let totalQuantity = orders.values.reduce(0) { $0 + $1.quantity }
        let totalPrice = orders.values.reduce(0) { $0 + ($1.price * $1.quantity) }
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        guard let formatTotalPrice = numFormatter.string(for: totalPrice) else {return}
        guard let formatTotalQuantity = numFormatter.string(for: totalQuantity) else {return}
        orderView.totalMenuCount.text = "총 \(formatTotalQuantity)개"
        orderView.totalMenuPrice.text = "\(formatTotalPrice)원"
        
        dataArray = orders.keys.sorted()
        orderView.tableView.reloadData()
    }
}
