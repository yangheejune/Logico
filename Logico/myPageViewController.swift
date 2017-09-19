//
//  myPageViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 15..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class myPageItemInfoTableViewCell: UITableViewCell {
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

class myPageUserInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var UserAddressName: UILabel!
    @IBOutlet weak var UserDelivery: UILabel!
    @IBOutlet weak var UserDeliveryCity: UILabel!
    @IBOutlet weak var UserDeliveryZipcode: UILabel!
}

class myPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myPageItemInfoTableView: UITableView!
    @IBOutlet weak var myPageUserInfoTableView: UITableView!
    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserMail: UILabel!
    
    
    let realm = try! Realm()
    var gDeliveryItemInfo = [cMyBoxItemInfo]()
    var gDeliberyUserInfo = [cMyBoxUserInfo]()
    var gUserInfomation = cMyPage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = ColorPalette.topColor
        
        self.tabBarController?.tabBar.barTintColor = ColorPalette.topColor

        myPageItemInfoTableView.delegate = self
        myPageItemInfoTableView.dataSource = self
        myPageUserInfoTableView.delegate = self
        myPageUserInfoTableView.dataSource = self
        
        gDeliveryItemInfo = getDeliveryItemInfo(UserID: "Logico")
        
        gDeliberyUserInfo = getDeliveryUserInfo(UserID: "Logico")
        gUserInfomation = getUserInfomation(UserID: "Logico")
        
        UserName.text = gUserInfomation.UserID
        UserMail.text = gUserInfomation.UserEmail
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myPageItemInfoTableView{
            return gDeliveryItemInfo.count
        } else {
            return gDeliberyUserInfo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == myPageItemInfoTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageItemInfo", for: indexPath) as! myPageItemInfoTableViewCell
            
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
            case 62:
                cell.ItemDestination.text = "대한민국"
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPageUserInfo", for: indexPath) as! myPageUserInfoTableViewCell
            
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
            case 62:
                cell.UserDelivery.text = "대한민국"
            default:
                cell.UserDelivery.text = ""
            }
            
            cell.UserDeliveryCity.text = gDeliberyUserInfo[indexPath.row].deliveryCity
            cell.UserDeliveryZipcode.text = gDeliberyUserInfo[indexPath.row].deliveryZipcode
            
            return cell
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyPageItemInfo"
        {
            
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
    
    func getUserInfomation(UserID: String) -> cMyPage {
        let UserInfo = realm.objects(cMyPage.self).filter("UserID == '\(UserID)'").first
        
        return UserInfo!
    }

}
