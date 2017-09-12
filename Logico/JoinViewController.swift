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
    @IBOutlet weak var Waybill: UILabel!
    
    @IBOutlet weak var BeginDate: UILabel!
    @IBOutlet weak var BeginAddress: UILabel!
    
    @IBOutlet weak var LocationDate: UILabel!
    @IBOutlet weak var LocationAddress: UILabel!
    
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var EndAddress: UILabel!
    
    @IBOutlet weak var CompanyImage: UIImageView!
    
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
        
        Waybill.text = "운송장 번호" + (deliveryitem?.waybill)!
        
        switch CompanyNumber {
        case 0:
            self.CompanyImage.image = UIImage(named: "")
        default:
            <#code#>
        }
        
        //let DeliveryServiceName = deliveryitem?.deliveryservicename
        BeginDate.text = formatter.string(from: (deliveryitem?.deliveryBegin)!)
        BeginAddress.text = deliveryitem?.deliveryBeginAddress
        
        EndDate.text = formatter.string(from: (deliveryitem?.deliveryEnd)!)
        EndAddress.text = deliveryitem?.deliveryEndAddress
        LocationAddress.text = deliveryitem?.deliveryLocation
        LocationDate.text = formatter.string(from: (deliveryitem?.deliveryLocationDate)!)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
