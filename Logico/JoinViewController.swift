//
//  JoinViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 8..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class JoinViewController: UIViewController {
    
    @IBOutlet weak var imgLocation0: UIImageView!
    @IBOutlet weak var imgLocation1: UIImageView!
    @IBOutlet weak var imgLocation2: UIImageView!
    @IBOutlet weak var imgLocation3: UIImageView!
    @IBOutlet weak var imgLocation4: UIImageView!
    @IBOutlet weak var imgLocation5: UIImageView!
    @IBOutlet weak var imgLocation6: UIImageView!
    @IBOutlet weak var imgLocation7: UIImageView!
    @IBOutlet weak var imgLocation8: UIImageView!
    @IBOutlet weak var imgLocation9: UIImageView!
    @IBOutlet weak var imgLocation10: UIImageView!
    
    
    @IBOutlet weak var lbBeginDate: UILabel!
    @IBOutlet weak var lbBeginAddress: UILabel!
    
    @IBOutlet weak var lbLocationDate1: UILabel!
    @IBOutlet weak var lbLocationAddress1: UILabel!
    @IBOutlet weak var lbLocationDate2: UILabel!
    @IBOutlet weak var lbLocationAddress2: UILabel!
    @IBOutlet weak var lbLocationDate3: UILabel!
    @IBOutlet weak var lbLocationAddress3: UILabel!
    @IBOutlet weak var lbLocationDate4: UILabel!
    @IBOutlet weak var lbLocationAddress4: UILabel!
  
    
    @IBOutlet weak var lbEndDate: UILabel!
    @IBOutlet weak var lbEndAddress: UILabel!
    
    var beginData = ""
    var beginAddress = ""
    var locationDate = ""
    var locationAddress = ""
    var endDate = ""
    var endAddress = ""
    var locationType = 0
    
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbBeginDate.text = beginData
        lbBeginAddress.text = beginAddress
            
        lbEndDate.text = endDate
        lbEndAddress.text = endAddress
        
        print("locationType = \(locationType)")
        
        let image = UIImage(named: "car")
        
        switch locationType {
        case 1:
            imgLocation1.image = image
            imgLocation1.frame = CGRect(x: self.imgLocation1.frame.minX - 15, y: self.imgLocation1.frame.minY - 15, width: self.imgLocation1.frame.width * 3, height: self.imgLocation1.frame.height * 3)
            
        case 2:
            imgLocation2.image = image
            imgLocation2.frame = CGRect(x: self.imgLocation2.frame.minX - 15, y: self.imgLocation2.frame.minY - 15, width: self.imgLocation2.frame.width * 3, height: self.imgLocation2.frame.height * 3)
        case 3:
            lbLocationAddress1.text = locationAddress
            lbLocationDate1.text = locationDate
            imgLocation3.image = image
            imgLocation3.frame = CGRect(x: self.imgLocation3.frame.minX - 15, y: self.imgLocation3.frame.minY - 15, width: self.imgLocation3.frame.width * 3, height: self.imgLocation3.frame.height * 3)
        case 4:
            imgLocation4.image = image
            imgLocation4.frame = CGRect(x: self.imgLocation4.frame.minX - 15, y: self.imgLocation4.frame.minY - 15, width: self.imgLocation4.frame.width * 3, height: self.imgLocation4.frame.height * 3)
        case 5:
            lbLocationAddress2.text = locationAddress
            lbLocationDate2.text = locationDate
            imgLocation5.image = image
            imgLocation5.frame = CGRect(x: self.imgLocation5.frame.minX - 15, y: self.imgLocation5.frame.minY - 15, width: self.imgLocation5.frame.width * 3, height: self.imgLocation5.frame.height * 3)
        case 6:
            imgLocation6.image = image
            imgLocation6.frame = CGRect(x: self.imgLocation6.frame.minX - 15, y: self.imgLocation6.frame.minY - 15, width: self.imgLocation6.frame.width * 3, height: self.imgLocation6.frame.height * 3)
        case 7:
            lbLocationAddress3.text = locationAddress
            lbLocationDate3.text = locationDate
            imgLocation7.image = image
            imgLocation7.frame = CGRect(x: self.imgLocation7.frame.minX - 15, y: self.imgLocation7.frame.minY - 15, width: self.imgLocation7.frame.width * 3, height: self.imgLocation7.frame.height * 3)
        case 8:
            imgLocation8.image = image
            imgLocation8.frame = CGRect(x: self.imgLocation8.frame.minX - 15, y: self.imgLocation8.frame.minY - 15, width: self.imgLocation8.frame.width * 3, height: self.imgLocation8.frame.height * 3)
        case 9:
            lbLocationAddress4.text = locationAddress
            lbLocationDate4.text = locationDate
            imgLocation9.image = image
            imgLocation9.frame = CGRect(x: self.imgLocation9.frame.minX - 15, y: self.imgLocation9.frame.minY - 15, width: self.imgLocation9.frame.width * 3, height: self.imgLocation9.frame.height * 3)
        case 10:
            imgLocation10.image = image
            imgLocation10.frame = CGRect(x: self.imgLocation10.frame.minX - 15, y: self.imgLocation10.frame.minY - 15, width: self.imgLocation10.frame.width * 3, height: self.imgLocation10.frame.height * 3)
        default: break
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func helpPopup(_ sender: Any) {
        let popup: DeliveryPopupView = UINib(nibName: "DeliveryPopupView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! DeliveryPopupView
        
        let viewColor = UIColor.clear
        popup.backgroundColor = viewColor.withAlphaComponent(0.3)
        popup.frame = self.view.frame
        
        let baseViewColor = UIColor.white
        popup.baseTextView.backgroundColor = baseViewColor.withAlphaComponent(0.8)
        
        popup.baseTextView.layer.cornerRadius = 9.0
        
        self.view.addSubview(popup)
    }
}
