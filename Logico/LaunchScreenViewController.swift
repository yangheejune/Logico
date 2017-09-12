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
    dynamic var waybill = ""                      // 운송장번호
    dynamic var deliveryservicename = 0           // 택배 업체명
    dynamic var deliveryBegin: Date? = nil        // 택배 배송 시작 시간
    dynamic var deliveryBeginAddress = ""         // 택배 배송 시작 주소
    dynamic var deliveryEnd: Date? = nil          // 택배 배송 도착 시간
    dynamic var deliveryEndAddress = ""           // 택배 배송 도착 주소
    dynamic var deliveryLocationDate: Date? = nil // 택배 현재 위치 시간
    dynamic var deliveryLocation = ""             // 택배 현재 위치
}

class cDeliveryServiceInfo: Object {
    dynamic var deliveryServiceName = String()          // 택배 업체명
    dynamic var deliveryType        = Int()             // 택배 종류 (1:서류, 2:비서류)
    dynamic var deliveryCountry     = Int()             // 보낼 나라 ex) 62: 대한민국 55:프랑스
    dynamic var deliveryWeight      = Int()             // 택배 중량 (최대 30kg까지)
    dynamic var deliveryCost        = Int()             // 택배 가격
}

class LaunchScreenViewController: UIViewController {
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd"
        
        try! realm.write {
            realm.deleteAll()
        }
        
        perform(#selector(LaunchScreenViewController.ShowNavController), with: nil, afterDelay: 2)
        
        addDeliveryItem(waybill: "1234", deliveryservicename: 1, deliveryBegin: formatter.date(from: "2017-08-26")!, deliveryBeginAddress: "대전시 유성구 대덕대로 512번길 20, 2층" , deliveryEnd: formatter.date(from: "2017-09-06")!, deliveryEndAddress: "미국 캘리포니아 주 쿠퍼티노", deliveryLocationDate: formatter.date(from: "2017-08-27")!, deliveryLocation: "대한민국 인천국제공항")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowNavController() {
        self.performSegue(withIdentifier: "LaunchScreen", sender: self)
    }
    
    func addDeliveryItem(waybill: String, deliveryservicename: Int, deliveryBegin: Date, deliveryBeginAddress: String, deliveryEnd: Date, deliveryEndAddress: String, deliveryLocationDate: Date, deliveryLocation: String) {
        let realmDeliveryItem = cDeliveryItem()
        
        realmDeliveryItem.waybill = waybill
        realmDeliveryItem.deliveryservicename = deliveryservicename
        realmDeliveryItem.deliveryBegin = deliveryBegin
        realmDeliveryItem.deliveryBeginAddress = deliveryBeginAddress
        realmDeliveryItem.deliveryEnd = deliveryEnd
        realmDeliveryItem.deliveryEndAddress = deliveryEndAddress
        realmDeliveryItem.deliveryLocationDate = deliveryLocationDate
        realmDeliveryItem.deliveryLocation = deliveryLocation
 
        
        
        try! realm.write {
            realm.add(realmDeliveryItem)
        }
        
        let deliveryitem = realm.objects(cDeliveryItem.self)
        
        print(deliveryitem)
        print("Delivery Item success")
    }
    
    func addDeliveryServiceInfo(deliveryServiceInfo: cDeliveryServiceInfo) {
        let realmDeliveryServiceInfo = cDeliveryServiceInfo()
        
        
        
        try! realm.write {
            realm.add(realmDeliveryServiceInfo)
        }
        print("Service Info success")
    }

}
