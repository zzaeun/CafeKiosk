//
//  FeatMenuData.swift
//  CafeKiosk
//
//  Created by 이정은 on 9/18/25.
//

import Foundation
import UIKit


// 메뉴 데이터 정의
struct FeatMenuData {
    
    static let drink = [
        FeatMenuItem(image: "아이스아메리카노", title: "아이스 아메리카노", price: 5700),
        FeatMenuItem(image: "자몽허니블랙티", title: "자몽 허니 블랙티", price: 6900),
        FeatMenuItem(image: "자바칩프라푸치노", title: "자바칩 프라푸치노", price: 3300)
    ]

    static let food = [
        FeatMenuItem(image: "멜팅치즈베이컨토스트", title: "멜팅 치즈 \n베이컨 토스트", price: 5700),
        FeatMenuItem(image: "바게트소금빵", title: "바게트 소금빵", price: 6900),
        FeatMenuItem(image: "진한가나슈9레이어케이크", title: "진한 가나슈 9\n레이어 케이크", price: 3300)
    ]
        
    static let product = [
        FeatMenuItem(image: "별바당블렌드", title: "별바당 블렌드 250g", price: 20000),
        FeatMenuItem(image: "시그니처사이렌머그", title: "시그니처 사이렌\n머그 237ml", price: 18000),
        FeatMenuItem(image: "SS커넥티드콩코드텀블러", title: "SS 커넥티드\n콩코드 텀블러 591ml", price: 42000)
    ]

}
