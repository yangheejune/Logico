//
//  DeliveryViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 7..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class DeliveryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var DeliverType: UITextField!
    
    @IBOutlet weak var DeliveryCountry: UITextField!
    @IBOutlet weak var DeliveryCity: UITextField!
    @IBOutlet weak var DeliveryZipcode: UITextField!

    @IBOutlet weak var DestinationCountry: UITextField!
    @IBOutlet weak var DestinationCity: UITextField!
    @IBOutlet weak var DestinationZipcode: UITextField!
    
    @IBOutlet weak var WeightField: UITextField!
    @IBOutlet weak var Volume_horizontal: UITextField!
    @IBOutlet weak var Volume_Vertical: UITextField!
    @IBOutlet weak var Volume_Height: UITextField!
    @IBOutlet weak var DeliveryCount: UITextField!
    
    var DeliveryTypePickerView = UIPickerView()
    var DeliveryCountryPickerView = UIPickerView()
    var DestinationCountryPickerView = UIPickerView()
    var WeightPickerView = UIPickerView()
    
    var DeliveryTypePickerNumber = 0
    var DeliveryPickerNumber = 0
    var DestinationPickerNumber = 0
    var WeightPickerNumber = 0
    var DeliveryItemCount = 0
    
    var DeliveryTypePickerDataSource = ["서류", "비서류"]
    var DeliveryPickerDataSource = ["대한민국"]
    var DestinationPickerDataSource = ["미국", "중국", "일본", "호주"]
    var WeightPickerDataSource = ["0.3", "0.5", "0.75", "1", "1.25", "1.5", "1.75", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "15.5", "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "20.5", "21", "21.5", "22", "22.5", "23", "23.5", "24", "24.5", "25", "25.5", "26", "26.5", "27", "27.5", "28", "28.5", "29", "29.5", "30"]

    var dimmingView: UIView!
    
    class func create() -> UIViewController {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: String(describing: self)) as! DeliveryViewController
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == DeliveryTypePickerView {
            return DeliveryTypePickerDataSource[row]
        } else if pickerView == DeliveryCountryPickerView {
            return DeliveryPickerDataSource[row]
        } else if pickerView == DestinationCountryPickerView {
            return DestinationPickerDataSource[row]
        } else if pickerView == WeightPickerView {
            return WeightPickerDataSource[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == DeliveryTypePickerView {
            return DeliveryTypePickerDataSource.count
        } else if pickerView == DeliveryCountryPickerView {
            return DeliveryPickerDataSource.count
        } else if pickerView == DestinationCountryPickerView {
            return DestinationPickerDataSource.count
        } else if pickerView == WeightPickerView {
            return WeightPickerDataSource.count
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == DeliveryTypePickerView {
            DeliverType.text = DeliveryTypePickerDataSource[row]
            DeliveryTypePickerNumber = row
        } else if pickerView == DeliveryCountryPickerView {
            DeliveryCountry.text = DeliveryPickerDataSource[row]
            DeliveryPickerNumber = row
        } else if pickerView == DestinationCountryPickerView {
            DestinationCountry.text = DestinationPickerDataSource[row]
            DestinationPickerNumber = row
        } else if pickerView == WeightPickerView {
            WeightField.text = WeightPickerDataSource[row]
            WeightPickerNumber = row
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DeliveryViewController.donePicker))

        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.DeliveryTypePickerView.delegate = self
        self.DeliveryCountryPickerView.delegate = self
        self.DestinationCountryPickerView.delegate = self
        self.WeightPickerView.delegate = self
        self.DeliveryCity.delegate = self
        self.DeliveryZipcode.delegate = self
        self.DestinationCountry.delegate = self
        self.DestinationCity.delegate = self
        self.DestinationZipcode.delegate = self
        self.WeightField.delegate = self
        self.Volume_horizontal.delegate = self
        self.Volume_Vertical.delegate = self
        self.Volume_Height.delegate = self
        self.DeliveryCount.delegate = self

        DeliverType.inputView = DeliveryTypePickerView
        DeliverType.text = nil
        DeliverType.inputAccessoryView = toolBar
        
        
        DeliveryCountry.inputView = DeliveryCountryPickerView
        DeliveryCountry.text = "대한민국"
        DeliveryCountry.inputAccessoryView = toolBar

        DestinationCountry.inputView = DestinationCountryPickerView
        DestinationCountry.inputAccessoryView = toolBar
        
        WeightField.inputView = WeightPickerView
        WeightField.inputAccessoryView = toolBar
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.wayBillField.becomeFirstResponder() //텍스트필드에 포커스
        DeliveryTypePickerNumber = 0
        DeliveryPickerNumber = 0
        DestinationPickerNumber = 0
        WeightPickerNumber = 0
        DeliveryItemCount = 0
        
        DeliverType.text = nil
        DeliveryCountry.text = "대한민국"
        WeightField.text = nil
        DeliveryCount.text = nil
        DeliveryCity.text = nil
        DeliveryZipcode.text = nil
        DestinationCountry.text = nil
        DestinationCity.text = nil
        DestinationZipcode.text = nil
        Volume_horizontal.text = nil
        Volume_Vertical.text = nil
        Volume_Height.text = nil
        
        self.view.setNeedsDisplay()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func Inquiry(_ sender: Any) {
        //self.performSegue(withIdentifier: "Delivery", sender: self)
    }
    
    @IBAction func DestinationHelp(_ sender: Any) {
        let popup: DestinationPopupView = UINib(nibName: "DestinationPopupView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! DestinationPopupView
        
        let viewColor = UIColor.brown
        popup.backgroundColor = viewColor.withAlphaComponent(0.3)
        popup.frame = self.view.frame
        
        let baseViewColor = UIColor.white
        popup.baseTextView.backgroundColor = baseViewColor.withAlphaComponent(0.8)
        
        popup.baseTextView.layer.cornerRadius = 9.0
        
        self.view.addSubview(popup)
    }
    
    @IBAction func WeightHelp(_ sender: Any) {
        let popup: WeightPopupView = UINib(nibName: "WeightPopupView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! WeightPopupView
        
        let viewColor = UIColor.brown
        popup.backgroundColor = viewColor.withAlphaComponent(0.3)
        popup.frame = self.view.frame
        
        let baseViewColor = UIColor.white
        popup.baseTextView.backgroundColor = baseViewColor.withAlphaComponent(0.8)
        
        popup.baseTextView.layer.cornerRadius = 9.0
        
        self.view.addSubview(popup)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let inquiry=segue.destination as! InquiryViewController
        
        inquiry.DeliveryCountry = DestinationPickerNumber
        inquiry.DeliveryWeight = Double(WeightPickerNumber)
        DeliveryItemCount = Int(DeliveryCount.text!)!
        inquiry.DeliveryItemCount = DeliveryItemCount
    }
    
    func donePicker() {
        WeightField.resignFirstResponder()
        DeliverType.resignFirstResponder()
        DeliveryCountry.resignFirstResponder()
        DestinationCountry.resignFirstResponder()
        DeliveryCount.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == DeliveryTypePickerView {
            DeliveryTypePickerView.resignFirstResponder()
        }
        else if textField == DeliveryCountryPickerView {
            DeliveryCountryPickerView.resignFirstResponder()
        }
        else if textField == DestinationCountryPickerView {
            DestinationCountryPickerView.resignFirstResponder()
        }
        else if textField == WeightPickerView {
            WeightPickerView.resignFirstResponder()
        }
        else if textField == DeliveryCity {
            DeliveryCity.resignFirstResponder()
        }
        else if textField == DeliveryZipcode {
            DeliveryZipcode.resignFirstResponder()
        }
        else if textField == DestinationCountry {
            DestinationCountry.resignFirstResponder()
        }
        else if textField == DestinationCity {
            DestinationCity.resignFirstResponder()
        }
        else if textField == DestinationZipcode {
            DestinationZipcode.resignFirstResponder()
        }
        else if textField == WeightField {
            WeightField.resignFirstResponder()
        }
        else if textField == Volume_horizontal {
            Volume_horizontal.resignFirstResponder()
        }
        else if textField == Volume_Vertical {
            Volume_Vertical.resignFirstResponder()
        }
        else if textField == Volume_Height {
            Volume_Height.resignFirstResponder()
        }
        else if textField == DeliveryCount {
            DeliveryCount.resignFirstResponder()
        }
        
        return true
    }

}
