//
//  Models.swift
//  Raily
//
//  Created by Dimitar Marinov on 07/11/2020.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct TrainMovement: XMLParsingMapper {
    let arrival: String?
    let departure: String?
    let autoArrival: Bool?
    let autoDepart: Bool?
    let stopType: String?
    
    let trainCode: String
    let trainDate: String?
    let locationCode: String
    let locationFullName: String
    let locationOrder: Int
    let locationType: String
    
    let trainOrigin: String
    let trainDestination: String
    let scheduledArrival: String
    
    let scheduledDeparture: String
    let expectedArrival: String
    let expectedDeparture: String
    
    init(xml: XML.Accessor) {
        arrival = xml.Arrival.text
        departure = xml.Departure.text
        autoArrival = xml.AutoArrival.bool
        autoDepart = xml.AutoDepart.bool
        stopType = xml.StopType.text
        trainCode = xml.TrainCode.text!
        trainDate = xml.TrainDate.text
        locationCode = xml.LocationCode.text!
        locationFullName = xml.LocationFullName.text!
        locationOrder = xml.LocationOrder.int!
        locationType = xml.LocationType.text!
        trainOrigin = xml.TrainOrigin.text!
        trainDestination = xml.TrainDestination.text!
        scheduledArrival = xml.ScheduledArrival.text!
        scheduledDeparture = xml.ScheduledDeparture.text!
        expectedArrival = xml.ExpectedArrival.text!
        expectedDeparture = xml.ExpectedDeparture.text!
    }
}
