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
    
    @IBOutlet weak var lbBeginDate: UILabel!
    @IBOutlet weak var lbBeginAddress: UILabel!
    
    @IBOutlet weak var lbLocationDate: UILabel!
    @IBOutlet weak var lbLocationAddress: UILabel!
    
    @IBOutlet weak var lbEndDate: UILabel!
    @IBOutlet weak var lbEndAddress: UILabel!
    
    var beginData: Date? = nil
    var beginAddress = ""
    var locationDate: Date? = nil
    var locationAddress = ""
    var endDate: Date? = nil
    var endAddress = ""
    
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd hh:mm:ss"

        lbBeginDate.lineBreakMode = .byWordWrapping
        lbBeginDate.numberOfLines = 0

        lbBeginDate.text = formatter.string(from: beginData!)
        lbBeginAddress.text = beginAddress
            
        lbEndDate.text = formatter.string(from: locationDate!)
        lbEndAddress.text = locationAddress
        lbLocationAddress.text = endAddress
        lbLocationDate.text = formatter.string(from: endDate!)
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
