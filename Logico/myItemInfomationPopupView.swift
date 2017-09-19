//
//  myItemInfomationPopupView.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 20..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit

class myItemInfomationPopupView: UIView {

    @IBOutlet weak var lbDeliverType: UILabel!
    
    @IBOutlet weak var lbDestinationCountry: UILabel!
    @IBOutlet weak var lbDestinationCity: UILabel!
    @IBOutlet weak var lbDestinationZipcode: UILabel!
    @IBOutlet weak var lbWeightField: UILabel!
    @IBOutlet weak var lbVolume_horizontal: UILabel!
    @IBOutlet weak var lbVolume_Vertical: UILabel!
    @IBOutlet weak var lbVolume_Height: UILabel!
    @IBOutlet weak var lbDeliveryCount: UILabel!
    
    var deliveryItem = gMyBoxItemInfo.init() 
    
    override func layoutSubviews() {
        print("deliveryItem = \(deliveryItem)")
        
        // 여기서 필드에 세그웨이에서 가지고 온 정보를 설정한다.
        if ggdeliveryItem.deliveryType == 0 {
            lbDeliverType.text = "서류"
        } else {
            lbDeliverType.text = "비서류"
        }
        
        switch ggdeliveryItem.destinationCountry {
        case 0:
            lbDestinationCountry.text = "미국"
        case 1:
            lbDestinationCountry.text = "중국"
        case 2:
            lbDestinationCountry.text = "일본"
        case 3:
            lbDestinationCountry.text = "호주"
        case 62:
            lbDestinationCountry.text = "대한민국"
        default:
            lbDestinationCountry.text = ""
        }
        
        lbDestinationCity.text = ggdeliveryItem.destinationCity
        lbDestinationZipcode.text = ggdeliveryItem.destinationZipcode
        lbWeightField.text = String(ggdeliveryItem.destinationWeight)
        lbVolume_horizontal.text = String(ggdeliveryItem.destinationHorizontal)
        lbVolume_Vertical.text = String(ggdeliveryItem.destinationVertical)
        lbVolume_Height.text = String(ggdeliveryItem.destinationHeight)
        lbDeliveryCount.text = String(ggdeliveryItem.destinationCount)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBAction func selected(_ sender: Any) {
        self.removeFromSuperview()
    }
    @IBAction func cancel(_ sender: Any) {
        self.removeFromSuperview()
    }
}
