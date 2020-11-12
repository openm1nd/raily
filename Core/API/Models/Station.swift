//
//  Station.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct Station: XMLParsingMapper {
    let stationDesc: String
    let stationCode: String
    let stationLatitude: Double
    let stationLongitude: Double
    let stationId: Int
    
    
    init(xml: XML.Accessor) {
        stationDesc = xml.StationDesc.text!
        stationCode = xml.StationCode.text!
        stationLatitude = xml.StationLatitude.double!
        stationLongitude = xml.StationLongitude.double!
        stationId = xml.StationId.int!
    }
}
