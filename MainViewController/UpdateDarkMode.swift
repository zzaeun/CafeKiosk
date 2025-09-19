
import Foundation
import UIKit

extension ViewController{
    //다크모드, 라이트모드 체크 및 호출 메서드
    func updateUIForDarkMode() {
        if isDarkModeEnabled {
            // 다크모드 백그라운드 설정
            view.backgroundColor = .black
            //메뉴 화면 다크모드
            appTitleLabel.textColor = .white
            isDarkModeButton.setImage(UIImage(named: "lightMode"),for: .normal)
            category.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
            category.backgroundColor = .darkGray
            
            //TableViewCell 다크 모드
            orderView.tableView.reloadData()
            //주문 내역 다크모드
            orderView.totalMenuCount.textColor = .white
            orderView.totalMenuPrice.textColor = .white
            orderView.orderAmount.textColor = .white
        }
        
        else {
            // 라이트모드 백그라운드 설정
            view.backgroundColor = .white
            
            //메뉴 화면 라이트모드
            appTitleLabel.textColor = .black
            isDarkModeButton.setImage(UIImage(named: "darkmode"),for: .normal)
            category.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
            category.backgroundColor = .white
            
            //TableViewCell 라이트 모드
            orderView.tableView.reloadData()
            //주문 내역 라이트모드
            orderView.totalMenuCount.textColor = .black
            orderView.totalMenuPrice.textColor = .black
            orderView.orderAmount.textColor = .black

        }
    }
    
    // 다크모드 버튼 선택
    @objc func darkModeTapped(_ sender: UIButton){
        //print("버튼탭")
        
        isDarkModeEnabled.toggle()
        
        updateUIForDarkMode()
    }
}
