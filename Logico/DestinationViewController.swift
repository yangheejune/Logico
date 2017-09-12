//
//  DestinationViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 7..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    @IBOutlet weak var deliveryServiceCompany: UIPickerView!
    @IBOutlet weak var wayBillField: UITextField!
    
    var CompanyNumber = 0
    
    var pickerDataSource = ["우체국EMS", "FedEx", "UPS", "DHL"];

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
        CompanyNumber = row
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.deliveryServiceCompany.dataSource = self
        self.deliveryServiceCompany.delegate = self
        self.wayBillField.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        self.wayBillField.becomeFirstResponder() //텍스트필드에 포커스
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
    
   

    @IBAction func Join(_ sender: Any) {
        self.performSegue(withIdentifier: "Destination", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let join=segue.destination as! JoinViewController
        join.CompanyNumber = CompanyNumber
        join.wayBillString = wayBillField.text!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
