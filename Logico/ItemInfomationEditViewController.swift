//
//  ItemInfomationEditViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 16..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ItemInfomationEditViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var TFdeliveryType: UITextField!
    @IBOutlet weak var TFdestinationCountry: UITextField!
    @IBOutlet weak var TFdestinationCity: UITextField!
    @IBOutlet weak var TFdestinationZipcode: UITextField!
    @IBOutlet weak var TFdestinationCount: UITextField!
    @IBOutlet weak var TFdestinationWeight: UITextField!
    @IBOutlet weak var TFdestinationHorizontal: UITextField!
    @IBOutlet weak var TFdestinationVertical: UITextField!
    @IBOutlet weak var TFdestinationHeight: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.TFdeliveryType.delegate = self
        self.TFdestinationCountry.delegate = self
        self.TFdestinationCity.delegate = self
        self.TFdestinationZipcode.delegate = self
        self.TFdestinationCount.delegate = self
        self.TFdestinationWeight.delegate = self
        self.TFdestinationHorizontal.delegate = self
        self.TFdestinationVertical.delegate = self
        self.TFdestinationHeight.delegate = self

        // 데이터 가지고 오기
        if ggdeliveryItem.deliveryType == 0 {
            TFdeliveryType.text = "서류"
        } else {
            TFdeliveryType.text = "비서류"
        }
        
        switch ggdeliveryItem.destinationCountry {
        case 0:
            TFdestinationCountry.text = "미국"
        case 1:
            TFdestinationCountry.text = "중국"
        case 2:
            TFdestinationCountry.text = "일본"
        case 3:
            TFdestinationCountry.text = "호주"
        case 62:
            TFdestinationCountry.text = "대한민국"
        default:
            TFdestinationCountry.text = ""
        }

        TFdestinationCity.text = ggdeliveryItem.destinationCity
        TFdestinationZipcode.text = ggdeliveryItem.destinationZipcode
        TFdestinationCount.text = String(ggdeliveryItem.destinationCount)
        TFdestinationWeight.text = String(ggdeliveryItem.destinationWeight)
        TFdestinationHorizontal.text = String(ggdeliveryItem.destinationHorizontal)
        TFdestinationVertical.text = String(ggdeliveryItem.destinationVertical)
        TFdestinationHeight.text = String(ggdeliveryItem.destinationHeight)
        
        TFdestinationZipcode.keyboardType = UIKeyboardType.numberPad
         TFdestinationCount.keyboardType = UIKeyboardType.numberPad
        TFdestinationWeight.keyboardType = UIKeyboardType.numberPad
        TFdestinationHorizontal.keyboardType = UIKeyboardType.numberPad
        TFdestinationVertical.keyboardType = UIKeyboardType.numberPad
        TFdestinationHeight.keyboardType = UIKeyboardType.numberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        if TFdeliveryType.text == "서류" {
            ggdeliveryItem.deliveryType = 0
        } else {
            ggdeliveryItem.deliveryType = 1
        }

        if TFdestinationCountry.text == "미국" {
            ggdeliveryItem.destinationCountry = 0
        } else if TFdestinationCountry.text == "중국" {
            ggdeliveryItem.destinationCountry = 1

        } else if TFdestinationCountry.text == "일본" {
            ggdeliveryItem.destinationCountry = 2

        } else if TFdestinationCountry.text == "호주" {
            ggdeliveryItem.destinationCountry = 3

        } else {
            ggdeliveryItem.destinationCountry = 62
        }

        ggdeliveryItem.destinationCity = TFdestinationCity.text!
        ggdeliveryItem.destinationZipcode = TFdestinationZipcode.text!
        ggdeliveryItem.destinationCount = Int(TFdestinationCount.text!)!
        ggdeliveryItem.destinationWeight = Double(TFdestinationWeight.text!)!
        ggdeliveryItem.destinationHorizontal = Double(TFdestinationHorizontal.text!)!
        ggdeliveryItem.destinationVertical = Double(TFdestinationVertical.text!)!
        ggdeliveryItem.destinationHeight = Double(TFdestinationHeight.text!)!
            
        UpdateMyBoxItemInfo(UserID: "Logico", BoxItemName: ggdeliveryItem.BoxItemName, deliveryType: ggdeliveryItem.deliveryType, destinationCountry: ggdeliveryItem.destinationCountry, destinationWeight: ggdeliveryItem.destinationWeight, destinationHorizontal: ggdeliveryItem.destinationHorizontal, destinationVertical: ggdeliveryItem.destinationVertical, destinationHeight: ggdeliveryItem.destinationHeight, destinationCity: ggdeliveryItem.destinationCity, destinationZipcode: ggdeliveryItem.destinationZipcode, destinationCount: ggdeliveryItem.destinationCount)
        
        //self.navigationController?.popViewController(animated: true)
        
        let alert = UIAlertController(title: "완료", message: "정보를 업데이트 하였습니다.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    func UpdateMyBoxItemInfo(UserID: String, BoxItemName: String, deliveryType: Int, destinationCountry: Int, destinationWeight: Double, destinationHorizontal: Double, destinationVertical: Double, destinationHeight: Double, destinationCity: String, destinationZipcode: String, destinationCount: Int) {
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
            realm.add(realmMyBoxItemInfo, update:true)
        }


        print("UpdateMyBoxItemInfo success")
    }
    
    // 리턴을 눌렀을 경우 다음 텍스트 선택
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == TFdeliveryType {
            TFdeliveryType.resignFirstResponder()
            TFdestinationCountry.becomeFirstResponder()
        } else if textField == TFdestinationCountry {
            TFdestinationCountry.resignFirstResponder()
            TFdestinationCity.becomeFirstResponder()
        } else if textField == TFdestinationCity {
            TFdestinationCity.resignFirstResponder()
            TFdestinationZipcode.becomeFirstResponder()
        } else if textField == TFdestinationZipcode {
            TFdestinationZipcode.resignFirstResponder()
            TFdestinationCount.becomeFirstResponder()
        }
        else if textField == TFdestinationCount {
            TFdestinationCount.resignFirstResponder()
            TFdestinationWeight.becomeFirstResponder()
        }
        else if textField == TFdestinationWeight {
            TFdestinationWeight.resignFirstResponder()
            TFdestinationHorizontal.becomeFirstResponder()
        }
        else if textField == TFdestinationHorizontal {
            TFdestinationHorizontal.resignFirstResponder()
            TFdestinationVertical.becomeFirstResponder()
        }
        else if textField == TFdestinationVertical {
            TFdestinationVertical.resignFirstResponder()
            TFdestinationHeight.becomeFirstResponder()
        }
        else if textField == TFdestinationHeight {
            TFdestinationHeight.resignFirstResponder()
        }
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
