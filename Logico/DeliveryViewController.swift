//
//  DeliveryViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 7..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class DeliveryViewController: UIViewController {

    @IBOutlet weak var DeliveryType: UIPickerView!
    
    @IBOutlet weak var Deliverycountry: UITextField!
    @IBOutlet weak var DeliveryCity: UITextField!
    @IBOutlet weak var DeliveryZipcode: UITextField!
    
    @IBOutlet weak var Destinationcountry: UITextField!
    @IBOutlet weak var DestinationCity: UITextField!
    @IBOutlet weak var DestinationZipcode: UITextField!
    
    @IBOutlet weak var WeightLabel: UITextField!
    @IBOutlet weak var Volume_horizontal: UITextField!
    @IBOutlet weak var Volume_Vertical: UITextField!
    @IBOutlet weak var Volume_Height: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Inquiry(_ sender: Any) {
        
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
