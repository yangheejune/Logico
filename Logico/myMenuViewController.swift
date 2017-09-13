//
//  myMenuViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 13..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class myMenuTableViewCell: UITableViewCell {
    @IBOutlet fileprivate weak var CompanyImage: UIImageView!
    @IBOutlet fileprivate weak var CompanyName: UILabel!
    @IBOutlet fileprivate weak var DerliveryType: UILabel!
    @IBOutlet fileprivate weak var DeliveryTerm: UILabel!
    @IBOutlet fileprivate weak var Cost: UILabel!
}

class myMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let realm = try! Realm()
    var gDeliveryitem = [cDeliveryServiceInfo]()
    
    @IBOutlet fileprivate var myMenuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myMenuTableView.delegate = self
        myMenuTableView.dataSource = self
        
        gDeliveryitem = getRealmDate()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myMenuTableViewCell
        
        if gDeliveryitem.isEmpty {
            return cell
        }
        
        cell.CompanyImage.image = UIImage(named: "dhl")
        
        cell.CompanyName.text = gDeliveryitem[indexPath.row].deliveryServiceName
        if gDeliveryitem[indexPath.row].deliveryType == 0 {
            cell.DerliveryType.text = "비서류"
        } else {
            cell.DerliveryType.text = "서류"
        }
        
        cell.DeliveryTerm.text = gDeliveryitem[indexPath.row].deliveryRequestTime
        
        cell.Cost.text = String(gDeliveryitem[indexPath.row].deliveryCost)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier : "WebView") as! WebViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        viewController.DestinationServiceType = gDeliveryitem[indexPath.row].deliveryServiceName
    }
    
    func getRealmDate() -> [cDeliveryServiceInfo] {
        var rtTotalTask = [cDeliveryServiceInfo]()
        let deliveryitem = realm.objects(cDeliveryServiceInfo.self)
        for cDeliveryServiceInfo in deliveryitem{
            rtTotalTask.append(cDeliveryServiceInfo)
        }
        return rtTotalTask
    }
}
