//
//  testViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 19..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class BoxInofomationCollectionCell: UICollectionViewCell {
    @IBOutlet weak var ItemDestination: UILabel!
    @IBOutlet weak var ItemName: UILabel!
}

class UserInfomationCollectionCell: UICollectionViewCell {
    @IBOutlet weak var UserTypeImage: UIImageView!
    @IBOutlet weak var UserAddressName: UILabel!
    @IBOutlet weak var UserDelivery: UILabel!
    @IBOutlet weak var UserDeliveryCity: UILabel!
    @IBOutlet weak var UserDeliveryZipcode: UILabel!
}

class testViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let realm = try! Realm()
    var gDeliveryItemInfo = [cMyBoxItemInfo]()
    var gDeliberyUserInfo = [cMyBoxUserInfo]()
    
    // 다음 뷰로 이동할 데이터를 저장할 변수
    var deliveryItem = gMyBoxItemInfo.init()
    var deliveryUser = gMyBoxUserInfo.init()
    
    @IBOutlet weak var BoxInofomationCollection: UICollectionView!
    
    @IBOutlet weak var UserInfomationCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BoxInofomationCollection.delegate = self
        BoxInofomationCollection.dataSource = self
        
        UserInfomationCollection.delegate = self
        UserInfomationCollection.dataSource = self
        
        self.navigationController?.navigationBar.barTintColor = ColorPalette.topColor
        
        self.tabBarController?.tabBar.barTintColor = ColorPalette.topColor

        gDeliveryItemInfo = getDeliveryItemInfo(UserID: "Logico")
        gDeliberyUserInfo = getDeliveryUserInfo(UserID: "Logico")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == BoxInofomationCollection {
            return gDeliveryItemInfo.count
        } else {
            return gDeliberyUserInfo.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == BoxInofomationCollection {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxInfomationColl", for: indexPath) as! BoxInofomationCollectionCell
            
            cell.selectedBackgroundView?.backgroundColor = ColorPalette.topColor
            
            if gDeliveryItemInfo.isEmpty {
                return cell
            }
            
            if gDeliveryItemInfo[indexPath.row].deliveryType == 0 {
                let bgImage = UIImageView();
                bgImage.image = UIImage(named: "PostBackground")
                cell.backgroundView = bgImage
            } else {
                let bgImage = UIImageView();
                bgImage.image = UIImage(named: "BoxBackground")
                cell.backgroundView = bgImage

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
            
            cell.ItemName.text = gDeliveryItemInfo[indexPath.row].BoxItemName
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserInfomationColl", for: indexPath) as! UserInfomationCollectionCell
            
            if gDeliberyUserInfo.isEmpty {
                return cell
            }
            
            cell.UserAddressName.text = gDeliberyUserInfo[indexPath.row].UserAddressName
            
            switch gDeliberyUserInfo[indexPath.row].UserType {
            case 1:
                cell.UserTypeImage.image = UIImage(named: "UserHome")
            case 2:
                cell.UserTypeImage.image = UIImage(named: "UserCompany")
            default: break
            }
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == BoxInofomationCollection {
            let cell = collectionView.cellForItem(at: indexPath)
            
            cell?.layer.borderWidth = 1.0
            cell?.layer.borderColor = UIColor.gray.cgColor
            
            if gDeliveryItemInfo.isEmpty {
                return
            }
            
            deliveryItem.deliveryType = gDeliveryItemInfo[indexPath.row].deliveryType
            
            deliveryItem.destinationCountry = gDeliveryItemInfo[indexPath.row].destinationCountry
            
            deliveryItem.destinationCity = gDeliveryItemInfo[indexPath.row].destinationCity
            
            deliveryItem.destinationZipcode = gDeliveryItemInfo[indexPath.row].destinationZipcode
            
            deliveryItem.destinationCount = gDeliveryItemInfo[indexPath.row].destinationCount
            
            deliveryItem.destinationWeight = gDeliveryItemInfo[indexPath.row].destinationWeight
            
            deliveryItem.destinationHorizontal = gDeliveryItemInfo[indexPath.row].destinationHorizontal
            
            deliveryItem.destinationVertical = gDeliveryItemInfo[indexPath.row].destinationVertical
            
            deliveryItem.destinationHeight = gDeliveryItemInfo[indexPath.row].destinationHeight
            
            ggdeliveryItem.deliveryType = deliveryItem.deliveryType
            ggdeliveryItem.destinationCountry = deliveryItem.destinationCountry
            ggdeliveryItem.destinationCity = deliveryItem.destinationCity
            ggdeliveryItem.destinationZipcode = deliveryItem.destinationZipcode
            ggdeliveryItem.destinationCount = deliveryItem.destinationCount
            ggdeliveryItem.destinationWeight = deliveryItem.destinationWeight
            ggdeliveryItem.destinationHorizontal = deliveryItem.destinationHorizontal
            ggdeliveryItem.destinationVertical = deliveryItem.destinationVertical
            ggdeliveryItem.destinationHeight = deliveryItem.destinationHeight

            // 팝업 뷰를 띄움
            let popup: myItemInfomationPopupView = UINib(nibName: "myItemInfomationPopupView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! myItemInfomationPopupView
            
            let viewColor = UIColor.clear
            popup.backgroundColor = viewColor.withAlphaComponent(0.3)
            popup.frame.size.height = self.view.frame.size.height
            popup.frame.size.width = self.view.frame.size.width
                
            self.view.addSubview(popup)
            
        } else {
            let cell = collectionView.cellForItem(at: indexPath)
            
            cell?.layer.borderWidth = 2.0
            cell?.layer.borderColor = UIColor.gray.cgColor
            
            if gDeliberyUserInfo.isEmpty {
                return
            }
            
            deliveryUser.UserAddressName = gDeliberyUserInfo[indexPath.row].UserAddressName
            
            deliveryUser.deliveryCountry = gDeliberyUserInfo[indexPath.row].deliveryCountry
            
            deliveryUser.deliveryCity = gDeliberyUserInfo[indexPath.row].deliveryCity
            
            deliveryUser.deliveryZipcode = gDeliberyUserInfo[indexPath.row].deliveryZipcode
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == BoxInofomationCollection {
            let cell = collectionView.cellForItem(at: indexPath)
            
            cell?.layer.borderWidth = 1.0
            cell?.layer.borderColor = UIColor.white.cgColor
            
        } else {
            let cell = collectionView.cellForItem(at: indexPath)
            
            cell?.layer.borderWidth = 1.0
            cell?.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let anyDeliveryUser: Any? = deliveryUser
        let anyDeliveryItem: Any? = deliveryItem
        if anyDeliveryUser == nil && anyDeliveryItem == nil {
            // 알람
            let alert = UIAlertController(title: "조회 실패", message: "자신의 물품정보나 배송지를 선택하지 않았습니다.", preferredStyle: UIAlertControllerStyle.alert)
                // add an action (button)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            let join=segue.destination as! myBoxJoinViewController
            join.deliveryUser = deliveryUser
            join.deliveryItem = deliveryItem
        }
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDeliveryItemInfo(UserID: String) -> [cMyBoxItemInfo] {
        var rtTotalTask = [cMyBoxItemInfo]()
        let deliveryitem = realm.objects(cMyBoxItemInfo.self).filter("UserID == '\(UserID)'")
        
        //print("cMyBoxItemInfo : \(deliveryitem)")
        
        for cMyBoxItemInfo in deliveryitem{
            rtTotalTask.append(cMyBoxItemInfo)
        }
        return rtTotalTask
    }
    
    func getDeliveryUserInfo(UserID: String) -> [cMyBoxUserInfo] {
        var rtTotalTask = [cMyBoxUserInfo]()
        let deliveryitem = realm.objects(cMyBoxUserInfo.self).filter("UserID == '\(UserID)'")
        // print("cMyBoxUserInfo : \(deliveryitem)")
        
        for cMyBoxUserInfo in deliveryitem{
            rtTotalTask.append(cMyBoxUserInfo)
        }
        return rtTotalTask
    }


}
