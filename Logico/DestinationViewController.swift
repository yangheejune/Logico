//
//  DestinationViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 7..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class DestinationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    let realm = try! Realm()
    
    @IBOutlet weak var deliveryServiceCompany: UITextField!
    @IBOutlet weak var wayBillField: UITextField!
    
    var deliveryServiceCompanyPickerView = UIPickerView()
    
    var CompanyString = ""
    var gDeliveryItem = cDeliveryItem()
    
    var pickerDataSource = ["EMS", "FedEx", "UPS", "DHL"]
    
    class func create() -> UIViewController {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: String(describing: self)) as! DestinationViewController
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        deliveryServiceCompany.text = pickerDataSource[row]
        CompanyString = pickerDataSource[row]
        
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.deliveryServiceCompanyPickerView.dataSource = self
        self.deliveryServiceCompanyPickerView.delegate = self
        self.wayBillField.delegate = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 110, green: 194, blue: 250, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "완료", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DestinationViewController.donePicker))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([flexibleSpace, flexibleSpace, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        
        // 키보드 숫자로 만들기
        wayBillField.keyboardType = UIKeyboardType.numberPad
        wayBillField.inputAccessoryView = toolBar
        
        deliveryServiceCompany.inputView = deliveryServiceCompanyPickerView
        deliveryServiceCompany.inputAccessoryView = toolBar
        
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        self.view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //self.view.setNeedsDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string == "\n") {
            wayBillField.resignFirstResponder()
            return false
        }
        return true
    }
    
    func donePicker() {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let gDeliveryItem = realm.objects(cDeliveryItem.self).filter("deliveryservicename = '\(CompanyString)' AND waybill = '\(wayBillField.text!)'").first
        
        if gDeliveryItem == nil {
            // 알람
            let alert = UIAlertController(title: "조회 실패", message: "정보를 입력하지 않았거나, 업체와 운송장 번호가 맞지 않습니다.", preferredStyle: UIAlertControllerStyle.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            let join=segue.destination as! JoinViewController
            join.beginData = (gDeliveryItem?.deliveryBegin)!
            join.beginAddress = (gDeliveryItem?.deliveryBeginAddress)!
            join.locationDate = (gDeliveryItem?.deliveryLocationDate)!
            join.locationAddress = (gDeliveryItem?.deliveryLocation)!
            join.endDate = (gDeliveryItem?.deliveryEnd)!
            join.endAddress = (gDeliveryItem?.deliveryEndAddress)!
            join.locationType = (gDeliveryItem?.deliveryLocationType)!
            
        }
        
        self.view.endEditing(true)
        // 인텍스 값을 가지고 있어야 함
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
