# MemoApp_CoreData
MemoApp_CoreData는 iOS에서 메모를 작성, 저장, 수정, 삭제할 수 있는 간단한 메모 애플리케이션이다.  
메모 데이터는 `Core Data`를 사용하여 저장된다.

## 주요 기능
- **메모 작성**: 사용자가 텍스트를 입력하여 메모를 추가할 수 있다.
- **메모 저장**: 입력한 메모는 `Core Data`에 저장되어 앱을 재실행해도 유지된다.
- **메모 수정**: 기존 메모를 수정하여 업데이트할 수 있다.
- **메모 삭제**: 개별 메모를 삭제할 수 있다.
- **코드베이스 UI 구성**: `UIView`, `UILabel`, `UITextField`, `UIButton`, `UITableView` 등을 코드로 구현하였다.

## 기술 스택
- **프레임워크**: UIKit
- **데이터 저장 방식**: Core Data
- **설계 패턴**: MVC (Model-View-Controller)
- **UI 구성**: 코드베이스

## 스크린샷
| 메인 화면 | 메모 추가 | 메모 수정 | 메모 삭제 |
|----------|---------|---------|---------|
| <img src="https://github.com/user-attachments/assets/bdde0675-2dcb-4a19-bb79-ed54f506af96" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/85a099ce-a00d-4288-a583-86bae37d158f" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/58e028f6-b9c4-402f-84f8-2a465b22839a" width="200" height="400"/> | <img src="https://github.com/user-attachments/assets/b0fd4248-5a8e-44ca-a88c-d665f52f7606" width="200" height="400"/> |

## 프로젝트 구조
```
## 프로젝트 구조
📦 MemoApp_CoreData
├── 📂 MemoApp_CoreData
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── 📂 Models
│   │   ├── MemoEntity+CoreDataClass.swift
│   │   ├── MemoEntity+CoreDataProperties.swift
│   │   ├── CoreDataManager.swift
│   ├── MainViewController.swift
│   ├── LaunchScreen.storyboard
│   ├── Assets.xcassets
│   ├── Info.plist
│   ├── MemoApp.xcdatamodeld
└── README.md
