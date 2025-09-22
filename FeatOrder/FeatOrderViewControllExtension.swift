
import Foundation
import UIKit

extension ViewController{
    
    
    
    // FeatOrderCell 프로토콜 메서드로 셀 수량 변경 시 호출
    func quantityDidChange(for cell: FeatOrderCell, newQuantity: Int) {
        // 변경이 일어난 셀의 indexPath를 가져옴
        guard let indexPath = orderView.tableView.indexPath(for: cell) else { return }
        
        //indexPathf를 이용해 dataArray에 해당 메뉴의 이름을 찾음
        let menuName = dataArray[indexPath.row]

        // 새로운 수량이 0이면 딕셔너리에서 메뉴 삭제
        if newQuantity == 0 {
            orders.removeValue(forKey: menuName)
        } else {
            orders[menuName]?.quantity = newQuantity
        }
    }
    
    // 주문 내역이 변경될 때 UI 업데이트
    func updateTableUI() {
        //총 수량
        let totalQuantity = orders.values.reduce(0) { $0 + $1.quantity }
        //총 가격
        let totalPrice = orders.values.reduce(0) { $0 + ($1.price * $1.quantity) }
        
        // 숫자를 세 자리마다 쉼표를 찍어주는 포맷터
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .decimal
        guard let formatTotalPrice = numFormatter.string(for: totalPrice) else {return}
        guard let formatTotalQuantity = numFormatter.string(for: totalQuantity) else {return}
        
        // 포맷터를 이용한 총 수량과 총 가격을 UI에 업데이트
        orderView.totalMenuCount.text = "총 \(formatTotalQuantity)개"
        orderView.totalMenuPrice.text = "\(formatTotalPrice)원"
        
        // 데이터 배열을 딕셔너리의 키 정렬하여 갱신
        dataArray = orders.keys.sorted()
        
        // reloadData로 테이블 뷰 데이터 새로고침
        orderView.tableView.reloadData()
    }
    
    // 음료 메뉴 탭 메서드
    @objc func drinkMenuTapped(_ sender: UITapGestureRecognizer){
        // 탭된 뷰 가져옴
        guard let tappedView = sender.view else {return}
        
        // 탭된 뷰의 태그를 통해 아이템 확인
        let tappedIndex = tappedView.tag
        let selectredItem = FeatMenuData.drink[tappedIndex]
        let menuName = selectredItem.title
        let menuPrice = selectredItem.price
        
        //order 딕셔너리에 이미 주문된 메뉴인지 확인
        if var existingOrderTuple = orders[menuName] {
            existingOrderTuple.quantity += 1
            orders[menuName] = existingOrderTuple
        } else {
            orders[menuName] = (price: menuPrice, quantity: 1)
        }
    }
    
    // 음식 메뉴 탭 메서드
    @objc func foodMenuTapped(_ sender: UITapGestureRecognizer){
        // 탭된 뷰 가져옴
        guard let tappedView = sender.view else {return}
        
        // 탭된 뷰의 태그를 통해 아이템 확인
        let tappedIndex = tappedView.tag
        let selectredItem = FeatMenuData.food[tappedIndex]
        let menuName = selectredItem.title
        let menuPrice = selectredItem.price
        
        //order 딕셔너리에 이미 주문된 메뉴인지 확인
        if var existingOrderTuple = orders[menuName] {
            existingOrderTuple.quantity += 1
            orders[menuName] = existingOrderTuple
        } else {
            orders[menuName] = (price: menuPrice, quantity: 1)
        }
    }
    // 상품 메뉴 탭 메서드
    @objc func productMenuTapped(_ sender: UITapGestureRecognizer){
        // 탭된 뷰 가져옴
        guard let tappedView = sender.view else {return}
        
        // 탭된 뷰의 태그를 통해 아이템 확인
        let tappedIndex = tappedView.tag
        let selectredItem = FeatMenuData.product[tappedIndex]
        let menuName = selectredItem.title
        let menuPrice = selectredItem.price
        
        //order 딕셔너리에 이미 주문된 메뉴인지 확인
        if var existingOrderTuple = orders[menuName] {
            existingOrderTuple.quantity += 1
            orders[menuName] = existingOrderTuple
        } else {
            orders[menuName] = (price: menuPrice, quantity: 1)
        }
    }
}
