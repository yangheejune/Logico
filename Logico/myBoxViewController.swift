//
//  myBoxViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 13..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class myBoxItemInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var ItemType: UILabel!
    @IBOutlet weak var ItemDestination: UILabel!
    @IBOutlet weak var ItemDestinationCity: UILabel!
    @IBOutlet weak var ItemDestinationZipcode: UILabel!
    @IBOutlet weak var ItemCount: UILabel!
    @IBOutlet weak var ItemWeight: UILabel!
    @IBOutlet weak var ItemHorizontal: UILabel!
    @IBOutlet weak var ItemVertical: UILabel!
    @IBOutlet weak var ItemHeight: UILabel!
}

class myBoxUserInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var UserAddressName: UILabel!
    @IBOutlet weak var UserDelivery: UILabel!
    @IBOutlet weak var UserDeliveryCity: UILabel!
    @IBOutlet weak var UserDeliveryZipcode: UILabel!
}

class myBoxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let realm = try! Realm()
    var gDeliveryItemInfo = [cMyBoxItemInfo]()
    var gDeliberyUserInfo = [cMyBoxUserInfo]()
    
    @IBOutlet fileprivate var myBoxItemInfoTableView: UITableView!
    
    @IBOutlet fileprivate var myBoxUserInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = ColorPalette.topColor
        
        self.tabBarController?.tabBar.barTintColor = ColorPalette.topColor
        
        myBoxItemInfoTableView.delegate = self
        myBoxItemInfoTableView.dataSource = self
        myBoxUserInfoTableView.delegate = self
        myBoxUserInfoTableView.dataSource = self
        
        gDeliveryItemInfo = getDeliveryItemInfo(UserID: "Logico")

        gDeliberyUserInfo = getDeliveryUserInfo(UserID: "Logico")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gDeliveryItemInfo = getDeliveryItemInfo(UserID: "Logico")
        gDeliberyUserInfo = getDeliveryUserInfo(UserID: "Logico")
        
        myBoxItemInfoTableView.reloadData()
        myBoxUserInfoTableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myBoxItemInfoTableView{
            return gDeliveryItemInfo.count
        } else {
            return gDeliberyUserInfo.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == myBoxItemInfoTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyBoxItemInfo", for: indexPath) as! myBoxItemInfoTableViewCell
            
            if gDeliveryItemInfo.isEmpty {
                return cell
            }
            
            if gDeliveryItemInfo[indexPath.row].deliveryType == 0 {
                cell.ItemType.text = "서류"
            } else {
                cell.ItemType.text = "비서류"
            }
            
            switch gDeliveryItemInfo[indexPath.row].destinationCountry {
            case 0:
                cell.ItemDestination.text = "미국"
            case 1:
                cell.ItemDestination.text = "중국"
            case 2:
                cell.ItemDestination.text = "일본"
            case 3:
                cell.ItemDestination.text = "호주"
            default:
                cell.ItemDestination.text = ""
            }
            
            cell.ItemDestinationCity.text = gDeliveryItemInfo[indexPath.row].destinationCity
            cell.ItemDestinationZipcode.text = gDeliveryItemInfo[indexPath.row].destinationZipcode
            cell.ItemCount.text = String(gDeliveryItemInfo[indexPath.row].destinationCount)
            cell.ItemWeight.text = String(gDeliveryItemInfo[indexPath.row].destinationWeight)
            cell.ItemHorizontal.text = String(gDeliveryItemInfo[indexPath.row].destinationHorizontal)
            cell.ItemVertical.text = String(gDeliveryItemInfo[indexPath.row].destinationVertical)
            cell.ItemHeight.text = String(gDeliveryItemInfo[indexPath.row].destinationHeight)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyBoxUserInfo", for: indexPath) as! myBoxUserInfoTableViewCell
            
            if gDeliberyUserInfo.isEmpty {
                return cell
            }
            
            cell.UserAddressName.text = gDeliberyUserInfo[indexPath.row].UserAddressName
            
            switch gDeliberyUserInfo[indexPath.row].deliveryCountry {
            case 0:
                cell.UserDelivery.text = "미국"
            case 1:
                cell.UserDelivery.text = "중국"
            case 2:
                cell.UserDelivery.text = "일본"
            case 3:
                cell.UserDelivery.text = "호주"
            default:
                cell.UserDelivery.text = ""
            }
            
            cell.UserDeliveryCity.text = gDeliberyUserInfo[indexPath.row].deliveryCity
            cell.UserDeliveryZipcode.text = gDeliberyUserInfo[indexPath.row].deliveryZipcode
            
            return cell
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == myBoxItemInfoTableView {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier : "DeliveryViewController") as! DeliveryViewController
            viewController.MyBoxItemInfo = gDeliveryItemInfo[indexPath.row]
        } else {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier : "DeliveryViewController") as! DeliveryViewController
            viewController.MyBoxUserInfo = gDeliberyUserInfo[indexPath.row]
        }
    }
    
    func getDeliveryItemInfo(UserID: String) -> [cMyBoxItemInfo] {
        var rtTotalTask = [cMyBoxItemInfo]()
        let deliveryitem = realm.objects(cMyBoxItemInfo.self).filter("UserID == '\(UserID)'")
        
        print("cMyBoxItemInfo : \(deliveryitem)")
        
        for cMyBoxItemInfo in deliveryitem{
            rtTotalTask.append(cMyBoxItemInfo)
        }
        return rtTotalTask
    }
    
    func getDeliveryUserInfo(UserID: String) -> [cMyBoxUserInfo] {
        var rtTotalTask = [cMyBoxUserInfo]()
        let deliveryitem = realm.objects(cMyBoxUserInfo.self).filter("UserID == '\(UserID)'")
        print("cMyBoxUserInfo : \(deliveryitem)")
        
        for cMyBoxUserInfo in deliveryitem{
            rtTotalTask.append(cMyBoxUserInfo)
        }
        return rtTotalTask
    }
    
    @IBAction func Setting(_ sender: Any) {
        // 여기서 물건 정보 와 발송지 정보를 선택하지 않고 설정을 눌렀을 경우 팝업창으로 경고 메시지 띄우고 설정 하도록 만듬
        
    }
}
