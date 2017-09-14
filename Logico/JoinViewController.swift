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
    
    @IBOutlet weak var BeginDate: UILabel!
    @IBOutlet weak var BeginAddress: UILabel!
    
    @IBOutlet weak var LocationDate: UILabel!
    @IBOutlet weak var LocationAddress: UILabel!
    
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var EndAddress: UILabel!
    
    var CompanyNumber = 0
    var wayBillString = ""
    
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd hh:mm:ss"

        print("CompanyNumber = \(CompanyNumber) , wayBillString = \(wayBillString)")
        
        // Do any additional setup after loading the view.
        
        BeginDate.lineBreakMode = .byWordWrapping
        BeginDate.numberOfLines = 0
        
        let deliveryitem = realm.objects(cDeliveryItem.self).filter("deliveryservicename == \(CompanyNumber) AND waybill = '\(wayBillString)'").first
        
        if deliveryitem != nil {
            BeginDate.text = formatter.string(from: (deliveryitem?.deliveryBegin)!)
            BeginAddress.text = deliveryitem?.deliveryBeginAddress
            
            EndDate.text = formatter.string(from: (deliveryitem?.deliveryEnd)!)
            EndAddress.text = deliveryitem?.deliveryEndAddress
            LocationAddress.text = deliveryitem?.deliveryLocation
            LocationDate.text = formatter.string(from: (deliveryitem?.deliveryLocationDate)!)
        }
        else {

            // 알람
            let alert = UIAlertController(title: "조회 실패", message: "업체와 운송장 번호가 맞지 않습니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func helpPopup(_ sender: Any) {
        let popup: DeliveryPopupView = UINib(nibName: "DeliveryPopupView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! DeliveryPopupView
        
        let viewColor = UIColor.brown
        popup.backgroundColor = viewColor.withAlphaComponent(0.3)
        popup.frame = self.view.frame
        
        let baseViewColor = UIColor.white
        popup.baseTextView.backgroundColor = baseViewColor.withAlphaComponent(0.8)
        
        popup.baseTextView.layer.cornerRadius = 9.0
        
        self.view.addSubview(popup)
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
