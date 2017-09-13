//
//  WebViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 13..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var DestinationServiceWeb: UIWebView!
    
    var DestinationServiceType = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        var url:URL
        
        switch DestinationServiceType {
        case "EMS":
            url = URL(string: "https://m.epost.go.kr/parcel/mobile/emsSubMenu.jsp")!
        case "FedEx":
            url = URL(string: "http://www.fedex.com/kr/index-mobile.html")!
        case "UPS":
            url = URL(string: "https://www.ups.com/kr/ko/Home.page")!
        case "DHL":
            url = URL(string: "http://m.dhl.co.kr/ko.html")!
        default:
            url = URL(string: "http://www.fedex.com/kr/index-mobile.html")!
        }
        
        DestinationServiceWeb.loadRequest(URLRequest(url: url))
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
