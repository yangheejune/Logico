//
//  LaunchScreenViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 7..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class cDeliveryItem: Object{
    dynamic var UserID                          = String()
    dynamic var waybill                         = String()        // 운송장번호
    dynamic var deliveryservicename             = String()        // 택배 업체명
    dynamic var deliveryBegin                   = String()        // 택배 배송 시작 기간
    dynamic var deliveryBeginAddress            = String()        // 택배 배송 시작 주소
    dynamic var deliveryEnd                     = String()        // 택배 배송 도착 기간
    dynamic var deliveryEndAddress              = String()        // 택배 배송 도착 주소
    dynamic var deliveryLocationDate            = String()        // 택배 현재 위치 시간
    dynamic var deliveryLocation                = String()        // 택배 현재 위치
    dynamic var deliveryLocationType            = Int()           // 현재 위치를  0~11까지 설정
}

class cDeliveryServiceInfo: Object {
    dynamic var deliveryServiceName = String()          // 택배 업체명
    dynamic var deliveryType        = Int()             // 택배 종류 (1:서류, 2:비서류)
    dynamic var deliveryServiceType = String()          // 프리미엄 서비스 인지 이런것들을 기록
    dynamic var deliveryCountry     = Int()             // 보낼 나라 ex) 62: 대한민국 55:프랑스
    dynamic var deliveryWeight      = Double()          // 택배 중량 (최대 30kg까지)
    dynamic var deliveryCity        = String()          // 택배 보낼 도시
    dynamic var deliveryZipcode     = String()          // 우편번호
    dynamic var deliveryCost        = Int()             // 택배 가격
    dynamic var deliveryDiscount    = Int()             // 할인율
    dynamic var deliveryRequestTime = String()          // 배송 소요 기간
}

class cMyBoxItemInfo: Object {
    dynamic var UserID                  = String()          // 나만의 택배 정보를 확인할 아이디
    dynamic var BoxItemName             = String()
    dynamic var deliveryType            = Int()             // 택배 종류 (1:서류, 2:비서류)
    dynamic var destinationCountry     = Int()          // 도착지 나라 ex) 62: 대한민국 55:프랑스
    dynamic var destinationWeight      = Double()       // 중량 (최대 30kg까지)
    dynamic var destinationHorizontal  = Double()       // 가로 길이
    dynamic var destinationVertical    = Double()       // 세로 길이
    dynamic var destinationHeight      = Double()       // 높이
    dynamic var destinationCity        = String()       // 도착 도시
    dynamic var destinationZipcode     = String()       // 도착 우편번호
    dynamic var destinationCount       = Int()          // 물품 갯수
}

class cMyBoxUserInfo: Object {
    dynamic var UserID              = String()          // 나만의 택배 정보를 확인할 아이디
    dynamic var UserType            = Int()             // 1이면 우리집 2이면 직장
    dynamic var UserAddressName     = String()          // 사용자 만의 발송명 지정
    dynamic var deliveryCountry     = Int()             // 발송 나라 ex) 62: 대한민국 55:프랑스
    dynamic var deliveryCity        = String()          // 발송 도시
    dynamic var deliveryZipcode     = String()          // 발송 우편번호
}

class cMyPage: Object {
    dynamic var UserID              = String()
    dynamic var UserEmail           = String()
}


class LaunchScreenViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var launchImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd"
        
        try! realm.write {
            realm.deleteAll()
        }
        
        perform(#selector(LaunchScreenViewController.ShowNavController), with: nil, afterDelay: 2)
        
//        UIView.animate(withDuration: 5.0, animations: ({
            
//            self.launchImage.transform = CGAffineTransform(translationX: 100, y: 100)
            // 가로 100, 세로 100 만큼 움직이는 메소드
            
            //self.launchImage.transform = CGAffineTransform(scaleX: 2, y: 2)
            // 가로 2배, 세로 2배 키우는 메소드
            
            //self.launchImage.transform = CGAffineTransform(rotationAngle: 3.14)
            // 객체를 회전하는 메소드!
            
            
//        }))


        // 중국 할인 특가
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "EMS", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "7~14")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "프리미엄", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "국제소포", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "20~30")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "국제통상", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "20~30")
        
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "EMS", deliveryCountry: 1, deliveryWeight: (0.5), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "7~14")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "프리미엄", deliveryCountry: 1, deliveryWeight: (0.5), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "국제소포", deliveryCountry: 1, deliveryWeight: (0.5), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "20~30")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "국제통상", deliveryCountry: 1, deliveryWeight: (0.5), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "20~30")
        
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "EMS", deliveryCountry: 1, deliveryWeight: (0.75), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "7~14")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "프리미엄", deliveryCountry: 1, deliveryWeight: (0.75), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "국제소포", deliveryCountry: 1, deliveryWeight: (0.75), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "20~30")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryServiceType: "국제통상", deliveryCountry: 1, deliveryWeight: (0.75), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20000, deliveryDiscount: 10, deliveryRequestTime: "20~30")
        
        addDeliveryServiceInfo(deliveryServiceName: "FedEx", deliveryType: 0, deliveryServiceType: "특송화물",deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 18000, deliveryDiscount: 15, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "FedEx", deliveryType: 0, deliveryServiceType: "이코노미화물",deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 18000, deliveryDiscount: 15, deliveryRequestTime: "2~4")
        
        addDeliveryServiceInfo(deliveryServiceName: "FedEx", deliveryType: 0, deliveryServiceType: "특송화물",deliveryCountry: 1, deliveryWeight: (0.5), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 18000, deliveryDiscount: 15, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "FedEx", deliveryType: 0, deliveryServiceType: "이코노미화물",deliveryCountry: 1, deliveryWeight: (0.5), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 18000, deliveryDiscount: 15, deliveryRequestTime: "2~4")
        
        addDeliveryServiceInfo(deliveryServiceName: "FedEx", deliveryType: 0, deliveryServiceType: "특송화물",deliveryCountry: 1, deliveryWeight: (0.75), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 18000, deliveryDiscount: 15, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "FedEx", deliveryType: 0, deliveryServiceType: "이코노미화물",deliveryCountry: 1, deliveryWeight: (0.75), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 18000, deliveryDiscount: 15, deliveryRequestTime: "2~4")
        
        addDeliveryServiceInfo(deliveryServiceName: "UPS", deliveryType: 0, deliveryServiceType: "Worldwide Express Plus", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20394, deliveryDiscount: 12, deliveryRequestTime: "1~3")
        addDeliveryServiceInfo(deliveryServiceName: "UPS", deliveryType: 0, deliveryServiceType: "Worldwide Express", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20394, deliveryDiscount: 12, deliveryRequestTime: "1~3")
        addDeliveryServiceInfo(deliveryServiceName: "UPS", deliveryType: 0, deliveryServiceType: "Worldwide Express Freight®", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20394, deliveryDiscount: 12, deliveryRequestTime: "1~3")
        addDeliveryServiceInfo(deliveryServiceName: "UPS", deliveryType: 0, deliveryServiceType: "Worldwide Express Freight® Midday", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20394, deliveryDiscount: 12, deliveryRequestTime: "1~3")
        addDeliveryServiceInfo(deliveryServiceName: "UPS", deliveryType: 0, deliveryServiceType: "Worldwide Express Saver®", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 20394, deliveryDiscount: 12, deliveryRequestTime: "1~3")
        
        // DHL
        addDeliveryServiceInfo(deliveryServiceName: "DHL", deliveryType: 0, deliveryServiceType: "DHL Express 9:00", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 16000, deliveryDiscount: 20, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "DHL", deliveryType: 0, deliveryServiceType: "DHL Express 10:30", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 16000, deliveryDiscount: 20, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "DHL", deliveryType: 0, deliveryServiceType: "DHL Express 12:00", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 16000, deliveryDiscount: 20, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "DHL", deliveryType: 0, deliveryServiceType: "DHL Express Worldwide", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 16000, deliveryDiscount: 20, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "DHL", deliveryType: 0, deliveryServiceType: "DHL Express 12:00 Import", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 16000, deliveryDiscount: 20, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "DHL", deliveryType: 0, deliveryServiceType: "DHL Express Worldwide Import", deliveryCountry: 1, deliveryWeight: (0.3), deliveryCity: "베이징", deliveryZipcode: "9879", deliveryCost: 16000, deliveryDiscount: 20, deliveryRequestTime: "2~4")

        // 운송장 번호 입력
        addDeliveryItem(UserID: "Logico", waybill: "1234", deliveryservicename: "FedEx", deliveryBegin: "2017-08-26", deliveryBeginAddress: "대전시 유성구 대덕대로 512번길 20, 2층" , deliveryEnd: "2017.09.10", deliveryEndAddress: "미국 캘리포니아 주 쿠퍼티노", deliveryLocationDate: "2017-09-19", deliveryLocation: "대한민국 인천국제공항", deliveryLocationType: 1)
        
        addDeliveryItem(UserID: "Logico", waybill: "4321", deliveryservicename: "EMS", deliveryBegin: "2017-09-18", deliveryBeginAddress: "대전시 유성구 대덕대로 512번길 20, 2층" , deliveryEnd: "2017.09.16", deliveryEndAddress: "중국 베이징", deliveryLocationDate: "2017-09-20", deliveryLocation: "대전시 우체국", deliveryLocationType: 3)
    
        // 나만의 배송 정보
        addMyBoxItemInfo(UserID: "Logico", BoxItemName: "다이소 물품", deliveryType: 1, destinationCountry: 1, destinationWeight: (0.3), destinationHorizontal: 10, destinationVertical: 10, destinationHeight: 3, destinationCity: "베이징", destinationZipcode: "9879", destinationCount: 10)
        
        addMyBoxItemInfo(UserID: "Logico", BoxItemName: "산적 견적서", deliveryType: 0, destinationCountry: 0, destinationWeight: (2.0), destinationHorizontal: 10, destinationVertical: 10, destinationHeight: 1, destinationCity: "LA", destinationZipcode: "1232", destinationCount: 10)
        
        addMyBoxItemInfo(UserID: "Logico", BoxItemName: "샤오미 물품", deliveryType: 0, destinationCountry: 2, destinationWeight: (0.5), destinationHorizontal: 2, destinationVertical: 2, destinationHeight: 1, destinationCity: "도쿄", destinationZipcode: "5232", destinationCount: 10)
        
        addMyBoxItemInfo(UserID: "Logico", BoxItemName: "결혼식 청첩장 샘플", deliveryType: 1, destinationCountry: 3, destinationWeight: (10.0), destinationHorizontal: 30, destinationVertical: 30, destinationHeight: 20, destinationCity: "시드니", destinationZipcode: "21434", destinationCount: 5)
        
        // 나만의 출발지 정보
        addMyBoxUserInfo(UserID: "Logico", UserType: 1,UserAddressName: "우리집", deliveryCountry: 62, deliveryCity: "경기도 광주시", deliveryZipcode: "12879")
        addMyBoxUserInfo(UserID: "Logico", UserType: 2, UserAddressName: "직장", deliveryCountry: 62, deliveryCity: "대전시 유성구", deliveryZipcode: "122392")
        
        // 나의 페이지 정보
        addMyPage(UserID: "Logico", UserEmail: "Logico@Logico.co.kr")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func ShowNavController() {
        self.performSegue(withIdentifier: "LaunchScreen2", sender: self)
    }
    
    func addDeliveryItem(UserID: String, waybill: String, deliveryservicename: String, deliveryBegin: String, deliveryBeginAddress: String, deliveryEnd: String, deliveryEndAddress: String, deliveryLocationDate: String, deliveryLocation: String, deliveryLocationType: Int) {
        let realmDeliveryItem = cDeliveryItem()
        
        realmDeliveryItem.UserID = UserID
        realmDeliveryItem.waybill = waybill
        realmDeliveryItem.deliveryservicename = deliveryservicename
        realmDeliveryItem.deliveryBegin = deliveryBegin
        realmDeliveryItem.deliveryBeginAddress = deliveryBeginAddress
        realmDeliveryItem.deliveryEnd = deliveryEnd
        realmDeliveryItem.deliveryEndAddress = deliveryEndAddress
        realmDeliveryItem.deliveryLocationDate = deliveryLocationDate
        realmDeliveryItem.deliveryLocation = deliveryLocation
        realmDeliveryItem.deliveryLocationType = deliveryLocationType
        
        try! realm.write {
            realm.add(realmDeliveryItem)
        }
        print("addDeliveryItem success")
    }
    
    func addDeliveryServiceInfo(deliveryServiceName: String, deliveryType: Int, deliveryServiceType: String, deliveryCountry: Int, deliveryWeight: Double, deliveryCity: String, deliveryZipcode: String, deliveryCost: Int, deliveryDiscount: Int, deliveryRequestTime: String) {
        let realmDeliveryServiceInfo = cDeliveryServiceInfo()
        
        realmDeliveryServiceInfo.deliveryServiceName = deliveryServiceName
        realmDeliveryServiceInfo.deliveryType = deliveryType
        realmDeliveryServiceInfo.deliveryServiceType = deliveryServiceType
        realmDeliveryServiceInfo.deliveryCountry = deliveryCountry
        realmDeliveryServiceInfo.deliveryWeight = deliveryWeight
        realmDeliveryServiceInfo.deliveryCity = deliveryCity
        realmDeliveryServiceInfo.deliveryZipcode = deliveryZipcode
        realmDeliveryServiceInfo.deliveryCost = deliveryCost
        realmDeliveryServiceInfo.deliveryDiscount = deliveryDiscount
        realmDeliveryServiceInfo.deliveryRequestTime = deliveryRequestTime
        
        try! realm.write {
            realm.add(realmDeliveryServiceInfo)
        }
        
        print("addDeliveryServiceInfo success")
    }

    func addMyBoxItemInfo(UserID: String, BoxItemName: String, deliveryType: Int, destinationCountry: Int, destinationWeight: Double, destinationHorizontal: Double, destinationVertical: Double, destinationHeight: Double, destinationCity: String, destinationZipcode: String, destinationCount: Int) {
        let realmMyBoxItemInfo = cMyBoxItemInfo()
        
        realmMyBoxItemInfo.UserID = UserID
        
        realmMyBoxItemInfo.BoxItemName = BoxItemName
        realmMyBoxItemInfo.deliveryType = deliveryType
        realmMyBoxItemInfo.destinationCountry = destinationCountry
        realmMyBoxItemInfo.destinationWeight = destinationWeight
        realmMyBoxItemInfo.destinationHorizontal = destinationHorizontal
        realmMyBoxItemInfo.destinationVertical = destinationVertical
        realmMyBoxItemInfo.destinationHeight = destinationHeight
        realmMyBoxItemInfo.destinationCity = destinationCity
        realmMyBoxItemInfo.destinationZipcode = destinationZipcode
        realmMyBoxItemInfo.destinationCount = destinationCount
        
        
        try! realm.write {
            realm.add(realmMyBoxItemInfo)
        }
        
        print("addMyBoxItemInfo success")
    }
    
    func addMyBoxUserInfo(UserID: String, UserType: Int, UserAddressName: String, deliveryCountry: Int, deliveryCity: String, deliveryZipcode: String) {
        let realmMyBoxUserInfo = cMyBoxUserInfo()
        
        realmMyBoxUserInfo.UserID = UserID
        realmMyBoxUserInfo.UserType = UserType
        realmMyBoxUserInfo.UserAddressName = UserAddressName
        realmMyBoxUserInfo.deliveryCountry = deliveryCountry
        realmMyBoxUserInfo.deliveryCity = deliveryCity
        realmMyBoxUserInfo.deliveryZipcode = deliveryZipcode
        
        try! realm.write {
            realm.add(realmMyBoxUserInfo)
        }
        
        print("addMyBoxUserInfo success")
    }

    func addMyPage(UserID: String, UserEmail: String) {
        let realmMyPage = cMyPage()
        
        realmMyPage.UserID = UserID
        realmMyPage.UserEmail = UserEmail
       
        
        try! realm.write {
            realm.add(realmMyPage)
        }
        
        print("addMyPage success")
    }


}
