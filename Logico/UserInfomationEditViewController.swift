//
//  UserInfomationEditViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 20..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class UserInfomationEditViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var TFAddressName: UITextField!
    @IBOutlet weak var TFDelivery: UITextField!
    @IBOutlet weak var TFDeliveryCity: UITextField!
    @IBOutlet weak var TFDeliveryZipCode: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.TFAddressName.delegate = self
        self.TFDelivery.delegate = self
        self.TFDeliveryCity.delegate = self
        self.TFDeliveryZipCode.delegate = self
        
        // 데이터 가지고 오기
        TFAddressName.text = ggUserItem.UserAddressName
        
        switch ggUserItem.deliveryCountry {
        case 0:
            TFDelivery.text = "미국"
        case 1:
            TFDelivery.text = "중국"
        case 2:
            TFDelivery.text = "일본"
        case 3:
            TFDelivery.text = "호주"
        case 62:
            TFDelivery.text = "대한민국"
        default:
            TFDelivery.text = ""
        }
        
        TFDeliveryCity.text = ggUserItem.deliveryCity
        TFDeliveryZipCode.text = ggUserItem.deliveryZipcode
        
        TFDeliveryZipCode.keyboardType = UIKeyboardType.numberPad
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        ggUserItem.UserAddressName = TFAddressName.text!
        
        if TFDelivery.text == "미국" {
            ggUserItem.deliveryCountry = 0
        } else if TFDelivery.text == "중국" {
            ggUserItem.deliveryCountry = 1
            
        } else if TFDelivery.text == "일본" {
            ggUserItem.deliveryCountry = 2
            
        } else if TFDelivery.text == "호주" {
            ggUserItem.deliveryCountry = 3
            
        } else {
            ggUserItem.deliveryCountry = 62
        }
        
        ggUserItem.deliveryCity = TFDeliveryCity.text!
        ggUserItem.deliveryZipcode = TFDeliveryZipCode.text!
        
        
        UpdateMyUserInfo(UserID: "Logico", UserAddressName: ggUserItem.UserAddressName, deliveryCountry: ggUserItem.deliveryCountry, deliveryCity: ggUserItem.deliveryCity, deliveryZipcode: ggUserItem.deliveryZipcode)
        
        let alert = UIAlertController(title: "완료", message: "정보를 업데이트 하였습니다.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func UpdateMyUserInfo(UserID: String, UserAddressName: String, deliveryCountry: Int, deliveryCity: String, deliveryZipcode: String) {
        let realmMyUserInfo = cMyBoxUserInfo()
        
        realmMyUserInfo.UserID = UserID
        
        realmMyUserInfo.UserAddressName = UserAddressName
        realmMyUserInfo.deliveryCountry = deliveryCountry
        realmMyUserInfo.deliveryCity = deliveryCity
        realmMyUserInfo.deliveryZipcode = deliveryZipcode
      
        try! realm.write {
            realm.add(realmMyUserInfo, update:true)
        }
        
        print("UpdateMyUserInfo success")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == TFAddressName {
            TFAddressName.resignFirstResponder()
        } else if textField == TFDelivery {
            TFDelivery.resignFirstResponder()
        } else if textField == TFDeliveryCity {
            TFDeliveryCity.resignFirstResponder()
        } else if textField == TFDeliveryZipCode {
            TFDeliveryZipCode.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
