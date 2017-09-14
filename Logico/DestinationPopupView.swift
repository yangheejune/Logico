//
//  DestinationPopupView.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 14..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class DestinationPopupView: UIView {

    @IBOutlet weak var baseTextView: UITextView!
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        self.removeFromSuperview()

    }
    
}
