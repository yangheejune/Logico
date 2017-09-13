//
//  DestinationViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 7..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
   
    @IBOutlet weak var deliveryServiceCompany: UITextField!
    @IBOutlet weak var wayBillField: UITextField!
    
    var deliveryServiceCompanyPickerView = UIPickerView()
    
    var CompanyNumber = 0
    
    var pickerDataSource = ["우체국EMS", "FedEx", "UPS", "DHL"]

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
        CompanyNumber = row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DestinationViewController.donePicker))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.deliveryServiceCompanyPickerView.dataSource = self
        self.deliveryServiceCompanyPickerView.delegate = self
        deliveryServiceCompany.inputView = deliveryServiceCompanyPickerView
        deliveryServiceCompany.inputAccessoryView = toolBar
        
        self.wayBillField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        deliveryServiceCompany.text = nil
        wayBillField.text = nil
        
        CompanyNumber = 0
        
        super.viewWillAppear(animated)

        self.view.setNeedsDisplay()
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
        deliveryServiceCompany.resignFirstResponder()
    }

    @IBAction func Join(_ sender: Any) {
        self.performSegue(withIdentifier: "Destination", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let join=segue.destination as! JoinViewController
        join.CompanyNumber = CompanyNumber
        join.wayBillString = wayBillField.text!
    }

}
