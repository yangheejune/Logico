//
//  LaunchScreen2ViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 13..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class LaunchScreen2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        perform(#selector(LaunchScreen2ViewController.ShowNavController), with: nil, afterDelay: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowNavController() {
        self.performSegue(withIdentifier: "LaunchScreen1", sender: self)
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
