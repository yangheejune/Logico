//
//  InquiryViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 12..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class InquiryTableViewCell: UITableViewCell {
    @IBOutlet fileprivate weak var CompanyImage: UIImageView!
    @IBOutlet fileprivate weak var CompanyName: UILabel!
    @IBOutlet fileprivate weak var DerliveryType: UILabel!
    @IBOutlet fileprivate weak var DeliveryTerm: UILabel!
    @IBOutlet fileprivate weak var Cost: UILabel!
}

class InquiryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let realm = try! Realm()

    @IBOutlet fileprivate weak var InquiryTableView: UITableView!
    
    
    var DeliveryCountry = 0
    var DeliveryWeight: Double = 0.0
    var DeliveryItemCount: Int?
    var gDeliveryitem = [cDeliveryServiceInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        InquiryTableView.allowsSelection = true
        InquiryTableView.delegate = self
        InquiryTableView.dataSource = self
        
        WeightConvertor()
        
        print(DeliveryWeight)
        
       
        gDeliveryitem = getRealmDate()
        
        // 거래 업체 정보가 있으면 그것을 저장함
        if gDeliveryitem.isEmpty {
            print("값이 없습니다.")
            // 알람
            let alert = UIAlertController(title: "조회 실패", message: "해당 요금과 기간에 맞는 업체가 없습니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        print(gDeliveryitem)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gDeliveryitem = getRealmDate()
        
        InquiryTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gDeliveryitem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InquiryTableViewCell
        
        if gDeliveryitem.isEmpty {
            return cell
        }
        
        cell.CompanyImage.image = UIImage(named: "dhl")
        
        cell.CompanyName.text = gDeliveryitem[indexPath.row].deliveryServiceName
        print("종류 : \(gDeliveryitem[indexPath.row].deliveryType)")
        if gDeliveryitem[indexPath.row].deliveryType == 0 {
            cell.DerliveryType.text = "서류"
        } else {
            cell.DerliveryType.text = "비서류"
        }
        
        cell.DeliveryTerm.text = gDeliveryitem[indexPath.row].deliveryRequestTime
        
        let sumCost = gDeliveryitem[indexPath.row].deliveryCost * DeliveryItemCount!
        
        cell.Cost.text = String(sumCost)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier : "WebView") as! WebViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        viewController.DestinationServiceType = gDeliveryitem[indexPath.row].deliveryServiceName
        
        // 나의 메뉴에 저장
        //addDeliveryServiceInfo(deliveryServiceName: gDeliveryitem[indexPath.row].deliveryServiceName, deliveryType: gDeliveryitem[indexPath.row].deliveryType, deliveryCountry: gDeliveryitem[indexPath.row].deliveryCountry, deliveryWeight: gDeliveryitem[indexPath.row].deliveryWeight, deliveryCost: gDeliveryitem[indexPath.row].deliveryCost, deliveryRequestTime: gDeliveryitem[indexPath.row].deliveryRequestTime)
    }
    
    func WeightConvertor() {
        // Weight 변환
        switch DeliveryWeight {
        case 0:
            DeliveryWeight = 0.3
        case 1:
            DeliveryWeight = 0.5
        case 2:
            DeliveryWeight = 0.75
        case 3:
            DeliveryWeight = 1.0
        case 4:
            DeliveryWeight = 1.25
        case 5:
            DeliveryWeight = 1.5
        case 6:
            DeliveryWeight = 1.75
        case 7:
            DeliveryWeight = 2.0
        case 8:
            DeliveryWeight = 2.5
        case 9:
            DeliveryWeight = 3.0
        case 10:
            DeliveryWeight = 3.5
        case 11:
            DeliveryWeight = 4.0
        case 12:
            DeliveryWeight = 4.5
        case 13:
            DeliveryWeight = 5.0
        case 14:
            DeliveryWeight = 5.5
        case 15:
            DeliveryWeight = 6.0
        case 16:
            DeliveryWeight = 6.5
        case 17:
            DeliveryWeight = 7.0
        case 18:
            DeliveryWeight = 7.5
        case 19:
            DeliveryWeight = 8.0
        case 20:
            DeliveryWeight = 8.5
        case 21:
            DeliveryWeight = 9.0
        case 22:
            DeliveryWeight = 9.5
        case 23:
            DeliveryWeight = 10.0
        case 24:
            DeliveryWeight = 10.5
        case 25:
            DeliveryWeight = 11.0
        case 26:
            DeliveryWeight = 11.5
        case 27:
            DeliveryWeight = 12.0
        case 28:
            DeliveryWeight = 12.5
        case 29:
            DeliveryWeight = 13.0
        case 30:
            DeliveryWeight = 13.5
        case 31:
            DeliveryWeight = 14.0
        case 32:
            DeliveryWeight = 14.5
        case 33:
            DeliveryWeight = 15.0
        case 34:
            DeliveryWeight = 15.5
        case 35:
            DeliveryWeight = 16.0
        case 36:
            DeliveryWeight = 16.5
        case 37:
            DeliveryWeight = 17.0
        case 38:
            DeliveryWeight = 17.5
        case 39:
            DeliveryWeight = 18.0
        case 40:
            DeliveryWeight = 18.5
        case 41:
            DeliveryWeight = 19.0
        case 42:
            DeliveryWeight = 19.5
        case 43:
            DeliveryWeight = 20.0
        case 44:
            DeliveryWeight = 20.5
        case 45:
            DeliveryWeight = 21.0
        case 46:
            DeliveryWeight = 21.5
        case 47:
            DeliveryWeight = 22.0
        case 48:
            DeliveryWeight = 22.5
        case 49:
            DeliveryWeight = 23.0
        case 50:
            DeliveryWeight = 23.5
        case 51:
            DeliveryWeight = 24.0
        case 52:
            DeliveryWeight = 24.5
        case 53:
            DeliveryWeight = 25.0
        case 54:
            DeliveryWeight = 25.5
        case 55:
            DeliveryWeight = 26.0
        case 56:
            DeliveryWeight = 26.5
        case 57:
            DeliveryWeight = 27.0
        case 58:
            DeliveryWeight = 27.5
        case 59:
            DeliveryWeight = 28.0
        case 60:
            DeliveryWeight = 28.5
        case 61:
            DeliveryWeight = 29.0
        case 62:
            DeliveryWeight = 29.5
        case 63:
            DeliveryWeight = 30.0
        default:
            DeliveryWeight = 1.0
        }
    }
    
//    func addDeliveryServiceInfo(deliveryServiceName: String, deliveryType: Int, deliveryCountry: Int, deliveryWeight: Double, deliveryCost: Int, deliveryRequestTime: String) {
//        let realmDeliveryServiceInfo = cMyMenu()
//        
//        realmDeliveryServiceInfo.deliveryServiceName = deliveryServiceName
//        realmDeliveryServiceInfo.deliveryType = deliveryType
//        realmDeliveryServiceInfo.deliveryCountry = deliveryCountry
//        realmDeliveryServiceInfo.deliveryWeight = deliveryWeight
//        realmDeliveryServiceInfo.deliveryCost = deliveryCost
//        realmDeliveryServiceInfo.deliveryRequestTime = deliveryRequestTime
//        
//        try! realm.write {
//            realm.add(realmDeliveryServiceInfo)
//        }
//        
//        print("Service Info success")
//    }
    
    func getRealmDate() -> [cDeliveryServiceInfo] {
        var rtTotalTask = [cDeliveryServiceInfo]()
        let deliveryitem = realm.objects(cDeliveryServiceInfo.self).filter("deliveryCountry == \(DeliveryCountry) AND deliveryWeight = \(DeliveryWeight)")
        for cDeliveryServiceInfo in deliveryitem{
            rtTotalTask.append(cDeliveryServiceInfo)
        }
        return rtTotalTask
    }
}
