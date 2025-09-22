## ☕️ 프로젝트 소개
스타벅스 메뉴를 기반으로 키오스크 주문 화면 만들기

## ⚒️ Development Environment
<img src="https://img.shields.io/badge/swift-%23FA7343.svg?&style=for-the-badge&logo=swift&logoColor=white" /> 

![Static Badge](https://img.shields.io/badge/iOS-18.5-blue)
![Static Badge](https://img.shields.io/badge/Xcode-16-green)
![Static Badge](https://img.shields.io/badge/SnapKit-5.7.1-beige)
<br>

## ✏️ Design
WireFrame <br>
<img width="800" height="700" alt="image" src="https://github.com/user-attachments/assets/09ea7fab-3c56-4818-ac8f-4cb0b18fe1b3" />

MainUI <br>
<img width="218" height="474" alt="image" src="https://github.com/user-attachments/assets/033ba182-bdea-455d-baaa-f285d79d6545" />


<br>

## 🍎 Developer

| 이름 | 담당 |
| ------ | ------ |
| 김리하 | 취소/주문 버튼, 예외 처리에 맞는 Alert 띄우기 |
| 이정은 | 카테고리 별 해당 메뉴 보여주기 |
| 장우석 | 메뉴 선택 시 이름 + 수량 + 가격을 장바구니에 보여주기 |

<br>

## 🖋️ Git FLow
```
1. develop 브랜치에서 새로운 브랜치를 생성한다.
2. 만든 브랜치에서 작업한다.
3. 커밋은 기능마다 쪼개서 작성한다.
4. 에러가 없으면 작업중인 브랜치에 push한다.
5. develop 브랜치에 merge 한다.
6. merge 후 pull해서 이상이 없는지 모두 확인한다.
```

<br>

## 🖋️ Git Commit
```
add : 새로운 파일 및 폴더 추가
    Ex) Add: 물건 사진 Resources폴더에 추가
feat : 새로운 기능 추가
    Ex) Feat: 메인 페이지에 카테고리 기능 추가
fix : 버그 수정
    Ex) Fix: 물건 버튼 클릭 시 장바구니에 들어가지 않는 버그 수정
refactor : 기능 변경 없이 코드 구조를 개선(가독성, 성능 향상 등)
    Ex) Refactor: 중복되는 로직 유틸 함수로 분리
docs : README, 주석 등 문서 추가 또는 수정(코드 변경 없음)
    Ex) Docs: git ReadMe 변경
Chore :  빌드 설정, 패키지 매니저 구성 등 기타 작업
    Ex) Chore: 폴더 경로 수정 및 SnapKit패키지 재설치
revert :  이전 커밋을 되돌리는 작업
    Ex) Revert: “Feat: 메인 페이지에 카테고리 기능 추가” 커밋 되돌리기
```

<br>

## 📁 Foldering
```
├── MainViewController
│   ├── UpdateDarkMode.swift
│   └── ViewController.swift
├── DarkMode
│   └── DarkModeSetting.swift
├── LaunchScreen
│   ├── LaunchScreenViewController.swift
├── FeatMenu
│   ├── FeatMenuData.swift
│   ├── FeatMenuItem.swift
│   ├── FeatMenuView.swift
│   ├── FeatMenuViewController.swift
│   └── FeatMenuViewController.swift
├── FeatOrder
│   ├── FeatOrderCell.swift
│   ├── FeatOrderTableView.swift
│   ├── FeatOrderView.swift
│   ├── FeatOrderViewControllExtension.swift
│   └── HexColor.swift
├── FeatButton
│   ├── FeatButtonView.swift
│   └── FeatButtonViewController.swift
├── CafeKiosk
│   ├── AppDelegate.swift
│   ├── Assets
│   └── SceneDelegate

``` 
