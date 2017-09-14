//
//  ParentsCategoryViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 14..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Segmentio

class ParentsCategoryViewController: UIViewController {

    fileprivate var containerViewController: CategoryViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.barTintColor = ColorPalette.topColor
        
        self.tabBarController?.tabBar.barTintColor = ColorPalette.topColor
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: CategoryViewController.self) {
            containerViewController = segue.destination as? CategoryViewController
            //containerViewController?.style = currentStyle
        }
    }
}
