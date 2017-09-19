//
//  globalVariables.swift
//  Logico
//
//  Created by 양희준 on 2017. 9. 8..
//  Copyright © 2017년 양희준. All rights reserved.
//

import UIKit


class gMyBoxItemInfo {
    var UserID                 = String()      // 나만의 택배 정보를 확인할 아이디
    var deliveryType           = Int()         // 택배 종류 (1:서류, 2:비서류)
    var destinationCountry     = Int()          // 도착지 나라 ex) 62: 대한민국 55:프랑스
    var destinationWeight      = Double()       // 중량 (최대 30kg까지)
    var destinationHorizontal  = Double()       // 가로 길이
    var destinationVertical    = Double()       // 세로 길이
    var destinationHeight      = Double()       // 높이
    var destinationCity        = String()       // 도착 도시
    var destinationZipcode     = String()       // 도착 우편번호
    var destinationCount       = Int()          // 물품 갯수
    
    init() {
        self.UserID = ""
        self.deliveryType = 0
        self.destinationCountry = -1
        self.destinationWeight = 0
        self.destinationHorizontal = 0
        self.destinationVertical = 0
        self.destinationHeight = 0
        self.destinationCity = ""
        self.destinationZipcode = ""
        self.destinationCount = 0
    }
}

class gMyBoxUserInfo {
    var UserID              = String()          // 나만의 택배 정보를 확인할 아이디
    var UserAddressName     = String()          // 사용자 만의 발송명 지정
    var deliveryCountry     = Int()             // 발송 나라 ex) 62: 대한민국 55:프랑스
    var deliveryCity        = String()          // 발송 도시
    var deliveryZipcode     = String()          // 발송 우편번호
    
    init() {
        self.UserID = ""
        self.UserAddressName = ""
        self.deliveryCountry = -1
        self.deliveryCity = ""
        self.deliveryZipcode = ""
        
    }
}

var ggdeliveryItem = gMyBoxItemInfo.init()

var DeliveryTypePickerDataSource = ["서류", "비서류"]
var DeliveryPickerDataSource = ["대한민국"]
var DestinationPickerDataSource = ["미국", "중국", "일본", "호주"]
var WeightPickerDataSource = ["0.3", "0.5", "0.75", "1", "1.25", "1.5", "1.75", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "12.5", "13", "13.5", "14", "14.5", "15", "15.5", "16", "16.5", "17", "17.5", "18", "18.5", "19", "19.5", "20", "20.5", "21", "21.5", "22", "22.5", "23", "23.5", "24", "24.5", "25", "25.5", "26", "26.5", "27", "27.5", "28", "28.5", "29", "29.5", "30"]
