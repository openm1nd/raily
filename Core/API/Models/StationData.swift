//
//  StationData.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation
import SwiftyXMLParser

struct StationData: XMLParsingMapper {
    let trainCode: String!
    let stationFullname: String!
    let stationCode: String!
    let trainDate: String!
    let origin: String!
    let destination: String!
    let originTime: String!
    let destinationTime: String!
    let status: String!
    let duein: Int?
    let late: Int?
    let expArrival: String?
    let expDepart: String?
    let schArrival: String?
    let schDepart: String?
    let direction: String?
    let trainType: String!
    let locationType: String!
    
    init(xml: XML.Accessor) {
        trainCode = xml.Traincode.text!
        stationFullname = xml.Stationfullname.text!
        stationCode = xml.Stationcode.text!
        trainDate = xml.Traindate.text!
        origin = xml.Origin.text!
        destination = xml.Destination.text!
        originTime = xml.Origintime.text!
        destinationTime = xml.Destinationtime.text!
        status = xml.Status.text!
        duein = xml.Duein.int
        late = xml.Late.int
        expArrival = xml.Exparrival.text
        expDepart = xml.Expdepart.text
        schArrival = xml.Scharrival.text
        schDepart = xml.Schdepart.text
        direction = xml.Direction.text
        trainType = xml.Traintype.text
        locationType = xml.Locationtype.text
    }
}
