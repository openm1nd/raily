//
//  StationDataTableViewCell.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

class StationDataTableViewCell: UITableViewCell {

    var stationData: StationData!
    var station: Station!

    func setup(station: Station, stationData: StationData) {
        self.station = station
        self.stationData = stationData
        textLabel?.text = stationData.origin + " > " + stationData.destination
         
        detailTextLabel?.text = stationData.trainCode + " Exp.Arrival: " + (stationData.expArrival ?? "N/A")
    }
}
