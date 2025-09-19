//
//  FeatButtonViewController.swift
//  CafeKiosk
//
//  Created by 김리하 on 9/18/25.
//

import UIKit

class FeatButtonViewController: UIViewController {
    
    var hasMenu: Bool = false // 메뉴 확인하는 버튼 연결해야댐
    let mainView = FeatButtonView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.orderButton.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        mainView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
    }
    
    // 주문하기 버튼 눌렀을 때 실행되는 코드
    @objc func orderButtonTapped() {
        // 메뉴 없을 때 실패 띄우기
        if !hasMenu {
            let failAlert = UIAlertController(title: "주문실패", message: "주문할 메뉴가 없습니다.\n 메뉴를 선택해주세요!", preferredStyle: .alert)
            failAlert.addAction(UIAlertAction(title: "확인", style: .default))
            present(failAlert, animated: true)
            return
            
        }
        
        
        // 메뉴 있을 때
        let alert = UIAlertController(title: "주문하기", message: "주문을 완료하시겠습니까?", preferredStyle: .alert)
        
        
        // "네" 버튼 부분 -> 주문완료 띄우기
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            let thankYouAlert = UIAlertController(title: "주문완료", message: "주문이 완료되었습니다!", preferredStyle: .alert)
            thankYouAlert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(thankYouAlert, animated: true)
            
        }
        
        
        // "아니오" 버튼 부분 -> 아무 일 안 일어남 그냥 사라짐
        let noAction = UIAlertAction(title: "아니오", style: .destructive)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
        
    }
    
    
    // 주문취소 버튼 눌렸을 때 실행되는 코드
    @objc func cancelButtonTapped() {
        
        let alert = UIAlertController(title: "주문취소", message: "주문 내역을 모두 삭제하시겠습니까?", preferredStyle: .alert)
        
        // "네" 누르면 주문 삭제 됐다구 뜨게 만들었어용
        
        let yesAction = UIAlertAction(title: "네", style: .default) { _ in
            let deleteAlert = UIAlertController(title: "삭제 완료", message: "주문 내역이 모두 삭제되었습니다!", preferredStyle: .alert)
            deleteAlert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(deleteAlert, animated: true)
        }
        
        // "아니오" 누르면 아무일도 안 일어나용
        let noAction = UIAlertAction(title: "아니오", style: .destructive)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
        
        
        
        
        
    }
    
}
