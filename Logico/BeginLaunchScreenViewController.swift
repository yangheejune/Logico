//
//  BeginLaunchScreenViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 20..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class BeginLaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        perform(#selector(BeginLaunchScreenViewController.ShowNavController), with: nil, afterDelay: 2)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func ShowNavController() {
        self.performSegue(withIdentifier: "LaunchScreen", sender: self)
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
