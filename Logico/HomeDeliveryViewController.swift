//
//  HomeDeliveryViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 15..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Segmentio

class HomeDeliveryViewController: UIViewController {
    
    fileprivate var currentStyle = SegmentioStyle.onlyLabel
    fileprivate var containerViewController: CategoryViewController?
    
    @IBOutlet fileprivate weak var bottomCardConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var heightConstraint: NSLayoutConstraint!
    
    class func create() -> UIViewController {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return mainStoryboard.instantiateViewController(withIdentifier: String(describing: self)) as! HomeDeliveryViewController
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "DeliveryBox")
        self.navigationItem.titleView = UIImageView(image: image)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: CategoryViewController.self) {
            containerViewController = segue.destination as? CategoryViewController
            containerViewController?.style = currentStyle
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
