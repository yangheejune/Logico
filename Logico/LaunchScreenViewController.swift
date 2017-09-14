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
    dynamic var deliveryWeight      = Double()          // 택배 중량 (최대 30kg까지)
    dynamic var deliveryCost        = Int()             // 택배 가격
    dynamic var deliveryRequestTime = String()          // 배송 소요 기간
}

class cMyMenu: Object {
    dynamic var deliveryServiceName = String()          // 택배 업체명
    dynamic var deliveryType        = Int()             // 택배 종류 (1:서류, 2:비서류)
    dynamic var deliveryCountry     = Int()             // 보낼 나라 ex) 62: 대한민국 55:프랑스
    dynamic var deliveryWeight      = Double()          // 택배 중량 (최대 30kg까지)
    dynamic var deliveryCost        = Int()             // 택배 가격
    dynamic var deliveryRequestTime = String()          // 배송 소요 기간
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
        
        
        perform(#selector(LaunchScreenViewController.ShowNavController), with: nil, afterDelay: 5)
        
        //UIView.animate(withDuration: 5.0, animations: {
            //self.launchImage.frame.origin.y = 100
        //}, completion: nil)
        
        UIView.animate(withDuration: 5.0, animations: ({
            
            self.launchImage.transform = CGAffineTransform(translationX: 100, y: 100)
            // 가로 100, 세로 100 만큼 움직이는 메소드
            
            //self.launchImage.transform = CGAffineTransform(scaleX: 2, y: 2)
            // 가로 2배, 세로 2배 키우는 메소드
            
            //self.launchImage.transform = CGAffineTransform(rotationAngle: 3.14)
            // 객체를 회전하는 메소드!
            
            
        }))


        // 중국
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: (0.3), deliveryCost: 20000, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: (0.5), deliveryCost: 23500, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: (0.75), deliveryCost: 25000, deliveryRequestTime: "2~4")
        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: (1.0), deliveryCost: 26500, deliveryRequestTime: "2~4")
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 1.25, deliveryCost: 28000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 1.5, deliveryCost: 30000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 1.75, deliveryCost: 31500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 2, deliveryCost: 32500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 2.5, deliveryCost: 34000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 3, deliveryCost: 35500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 3.5, deliveryCost: 37000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 4, deliveryCost: 39000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 4.5, deliveryCost: 40500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 5, deliveryCost: 42000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 5.5, deliveryCost: 44000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 6, deliveryCost: 45500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 6.5, deliveryCost: 47000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 7, deliveryCost: 48500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 7.5, deliveryCost: 50500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 8, deliveryCost: 52000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 8.5, deliveryCost: 53500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 9, deliveryCost: 55500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 9.5, deliveryCost: 57000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 10, deliveryCost: 58500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 10.5, deliveryCost: 60000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 11, deliveryCost: 62000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 11.5, deliveryCost: 63500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 12, deliveryCost: 65000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 12.5, deliveryCost: 67000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 13, deliveryCost: 68500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 13.5, deliveryCost: 70000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 14, deliveryCost: 72000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 14.5, deliveryCost: 73500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 15, deliveryCost: 75000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 15.5, deliveryCost: 76500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 16, deliveryCost: 78500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 16.5, deliveryCost: 80500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 17, deliveryCost: 82500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 17.5, deliveryCost: 84500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 18, deliveryCost: 86500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 18.5, deliveryCost: 88500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 19, deliveryCost: 90000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 19.5, deliveryCost: 92000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 20, deliveryCost: 94000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 20.5, deliveryCost: 96000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 21, deliveryCost: 98000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 21.5, deliveryCost: 100000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 22, deliveryCost: 102000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 22.5, deliveryCost: 103500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 23, deliveryCost: 105500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 23.5, deliveryCost: 107500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 24, deliveryCost: 109500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 24.5, deliveryCost: 111500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 25, deliveryCost: 113500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 25.5, deliveryCost: 115500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 26, deliveryCost: 117000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 26.5, deliveryCost: 119000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 27, deliveryCost: 121000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 27.5, deliveryCost: 123000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 28, deliveryCost: 125000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 28.5, deliveryCost: 127000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 29, deliveryCost: 129000)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 29.5, deliveryCost: 130500)
//        addDeliveryServiceInfo(deliveryServiceName: "EMS", deliveryType: 0, deliveryCountry: 1, deliveryWeight: 30, deliveryCost: 132500)
        
        addDeliveryItem(waybill: "1234", deliveryservicename: 1, deliveryBegin: formatter.date(from: "2017-08-26")!, deliveryBeginAddress: "대전시 유성구 대덕대로 512번길 20, 2층" , deliveryEnd: formatter.date(from: "2017-09-06")!, deliveryEndAddress: "미국 캘리포니아 주 쿠퍼티노", deliveryLocationDate: formatter.date(from: "2017-08-27")!, deliveryLocation: "대한민국 인천국제공항")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowNavController() {
        self.performSegue(withIdentifier: "LaunchScreen2", sender: self)
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
    
    func addDeliveryServiceInfo(deliveryServiceName: String, deliveryType: Int, deliveryCountry: Int, deliveryWeight: Double, deliveryCost: Int, deliveryRequestTime: String) {
        let realmDeliveryServiceInfo = cDeliveryServiceInfo()
        
        realmDeliveryServiceInfo.deliveryServiceName = deliveryServiceName
        realmDeliveryServiceInfo.deliveryType = deliveryType
        realmDeliveryServiceInfo.deliveryCountry = deliveryCountry
        realmDeliveryServiceInfo.deliveryWeight = deliveryWeight
        realmDeliveryServiceInfo.deliveryCost = deliveryCost
        realmDeliveryServiceInfo.deliveryRequestTime = deliveryRequestTime
        
        try! realm.write {
            realm.add(realmDeliveryServiceInfo)
        }
        
        print("Service Info success")
    }

}
