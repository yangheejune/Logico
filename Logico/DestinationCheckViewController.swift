//
//  DestinationCheckViewController.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 15..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class myDestinationCheckTableViewCell: UITableViewCell {
    @IBOutlet weak var WayBill: UILabel!
    @IBOutlet weak var DeliveryServiceName: UILabel!
    @IBOutlet weak var DeliveryBegin: UILabel!
}

class DestinationCheckViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let realm = try! Realm()
    var gDeliveryItem = [cDeliveryItem]()
    
    @IBOutlet weak var myDestinationCheckTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myDestinationCheckTableView.allowsSelection = true
        myDestinationCheckTableView.delegate = self
        myDestinationCheckTableView.dataSource = self
        
        gDeliveryItem = getDeliveryItem(UserID: "Logico")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gDeliveryItem = getDeliveryItem(UserID: "Logico")
        
        myDestinationCheckTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gDeliveryItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationCheck", for: indexPath) as! myDestinationCheckTableViewCell
        
        if gDeliveryItem.isEmpty {
            return cell
        }
        
        cell.WayBill.text = gDeliveryItem[indexPath.row].waybill
        cell.DeliveryServiceName.text = gDeliveryItem[indexPath.row].deliveryservicename
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd hh:mm:ss"
        
        cell.DeliveryBegin.text = formatter.string(from: (gDeliveryItem[indexPath.row].deliveryBegin)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier : "JoinView") as! JoinViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        viewController.beginData = gDeliveryItem[indexPath.row].deliveryBegin
        viewController.beginAddress = gDeliveryItem[indexPath.row].deliveryBeginAddress
        viewController.locationDate = gDeliveryItem[indexPath.row].deliveryLocationDate
        viewController.locationAddress = gDeliveryItem[indexPath.row].deliveryLocation
        viewController.endDate = gDeliveryItem[indexPath.row].deliveryEnd
        viewController.endAddress = gDeliveryItem[indexPath.row].deliveryEndAddress
    }
    
    func getDeliveryItem(UserID: String) -> [cDeliveryItem] {
        var rtTotalTask = [cDeliveryItem]()
        let deliveryitem = realm.objects(cDeliveryItem.self).filter("UserID == '\(UserID)'")
        
        print("cDeliveryItem : \(deliveryitem)")
        
        for cDeliveryItem in deliveryitem{
            rtTotalTask.append(cDeliveryItem)
        }
        return rtTotalTask
    }
}
