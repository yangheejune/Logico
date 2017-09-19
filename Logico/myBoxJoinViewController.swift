//
//  myBoxJoinViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 19..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class myBoxJoinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
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

    
    // 부모 뷰에서 데이터 전달해서 설정해주기 위한 세그웨이 변수
    var deliveryItem = gMyBoxItemInfo()
    var deliveryUser = gMyBoxUserInfo()
    
    var DeliveryTypePickerView = UIPickerView()
    var DeliveryCountryPickerView = UIPickerView()
    var DestinationCountryPickerView = UIPickerView()
    var WeightPickerView = UIPickerView()
    
    var DestinationPickerNumber = 0
    var WeightPickerNumber = 0
    var DeliveryItemCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        
        // 키보드 숫자로 만들기
        DeliveryZipcode.keyboardType = UIKeyboardType.numberPad
        DestinationZipcode.keyboardType = UIKeyboardType.numberPad
        WeightField.keyboardType = UIKeyboardType.numberPad
        Volume_horizontal.keyboardType = UIKeyboardType.numberPad
        Volume_Vertical.keyboardType = UIKeyboardType.numberPad
        Volume_Height.keyboardType = UIKeyboardType.numberPad
        DeliveryCount.keyboardType = UIKeyboardType.numberPad

        // PickerView setting
        DeliverType.inputView = DeliveryTypePickerView
        DeliverType.text = "서류"
        
        DeliveryCountry.inputView = DeliveryCountryPickerView
        DeliveryCountry.text = "대한민국"
        
        DestinationCountry.inputView = DestinationCountryPickerView
        
        WeightField.inputView = WeightPickerView

        // 여기서 필드에 세그웨이에서 가지고 온 정보를 설정한다.
        if deliveryItem.deliveryType == 0 {
            DeliverType.text = "서류"
        } else {
            DeliverType.text = "비서류"
        }
            
        switch deliveryItem.destinationCountry {
        case 0:
            DestinationCountry.text = "미국"
        case 1:
            DestinationCountry.text = "중국"
        case 2:
            DestinationCountry.text = "일본"
        case 3:
            DestinationCountry.text = "호주"
        case 62:
            DestinationCountry.text = "대한민국"
        default:
            DestinationCountry.text = ""
        }
        DestinationPickerNumber = deliveryItem.destinationCountry
        WeightPickerNumber = Int(deliveryItem.destinationWeight)
        DeliveryItemCount = deliveryItem.destinationCount
        
            
        DestinationCity.text = deliveryItem.destinationCity
        DestinationZipcode.text = deliveryItem.destinationZipcode
        WeightField.text = String(deliveryItem.destinationWeight)
        Volume_horizontal.text = String(deliveryItem.destinationHorizontal)
        Volume_Vertical.text = String(deliveryItem.destinationVertical)
        Volume_Height.text = String(deliveryItem.destinationHeight)
        DeliveryCount.text = String(deliveryItem.destinationCount)

        switch deliveryUser.deliveryCountry {
        case 62:
            DeliveryCountry.text = "대한민국"
        default:
            DeliveryCountry.text = ""
        }
            
        DeliveryCity.text = deliveryUser.deliveryCity
        DeliveryZipcode.text = deliveryUser.deliveryZipcode
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.endEditing(true)
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
        } else if pickerView == DeliveryCountryPickerView {
            DeliveryCountry.text = DeliveryPickerDataSource[row]
        } else if pickerView == DestinationCountryPickerView {
            DestinationCountry.text = DestinationPickerDataSource[row]
            DestinationPickerNumber = row
        } else if pickerView == WeightPickerView {
            WeightField.text = WeightPickerDataSource[row]
            WeightPickerNumber = row
        }
        self.view.endEditing(true)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let inquiry=segue.destination as! InquiryViewController
        
        if ((DeliverType.text?.isEmpty)! || (DeliveryCountry.text?.isEmpty)! || (DeliveryCity.text?.isEmpty)! || (DeliveryZipcode.text?.isEmpty)! || (DestinationCountry.text?.isEmpty)! || (DestinationCity.text?.isEmpty)! || (DestinationZipcode.text?.isEmpty)! || (WeightField.text?.isEmpty)! || (Volume_horizontal.text?.isEmpty)! || (Volume_Vertical.text?.isEmpty)! || (Volume_Height.text?.isEmpty)! || (DeliveryCount.text?.isEmpty)!) {
            let alert = UIAlertController(title: "에러", message: "정보를 입력하지 않은 곳이 있습니다. 확인해 주세요.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            inquiry.DeliveryCountry = DestinationPickerNumber
            inquiry.DeliveryWeight = Double(WeightPickerNumber)
            DeliveryItemCount = Int(DeliveryCount.text!)!
            inquiry.DeliveryItemCount = DeliveryItemCount
            
            // 여기서 DB 조회
        }
        
        
    }
    
    // 리턴을 눌렀을 경우 다음 텍스트 선택
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == DeliverType {
            DeliverType.resignFirstResponder()
            DeliveryCountry.becomeFirstResponder()
        } else if textField == DeliveryCountry {
            DeliveryCountry.resignFirstResponder()
            DeliveryCity.becomeFirstResponder()
        } else if textField == DeliveryCity {
            DeliveryCity.resignFirstResponder()
            DeliveryZipcode.becomeFirstResponder()
        } else if textField == DeliveryZipcode {
            DeliveryZipcode.resignFirstResponder()
            DestinationCountry.becomeFirstResponder()
        }
        else if textField == DestinationCountry {
            DestinationCountry.resignFirstResponder()
            DestinationCity.becomeFirstResponder()
        }
        else if textField == DestinationCity {
            DestinationCity.resignFirstResponder()
            DestinationZipcode.becomeFirstResponder()
        }
        else if textField == DestinationZipcode {
            DestinationZipcode.resignFirstResponder()
            WeightPickerView.becomeFirstResponder()
        }
        else if textField == WeightPickerView {
            WeightPickerView.resignFirstResponder()
            Volume_horizontal.becomeFirstResponder()
        }
        else if textField == Volume_horizontal {
            Volume_horizontal.resignFirstResponder()
            Volume_Vertical.becomeFirstResponder()
        }
        else if textField == Volume_Vertical {
            Volume_Vertical.resignFirstResponder()
            Volume_Height.becomeFirstResponder()
        }
        else if textField == Volume_Height {
            Volume_Height.resignFirstResponder()
            DeliveryCount.becomeFirstResponder()
        }
        else if textField == DeliveryCount {
            DeliveryCount.resignFirstResponder()
        }
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
