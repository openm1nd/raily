//
//  StationDataTableViewCell.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

class TrainMovementTableViewCell: UITableViewCell {

    func setup(trainMovement: TrainMovement, stationData: StationData) {
        let order = "\(trainMovement.locationOrder)"
        textLabel?.text = "\(order). \(trainMovement.locationFullName)"
        var details = ""
        if trainMovement.scheduledArrival != trainMovement.expectedArrival {
            details = "\(trainMovement.scheduledArrival) exp. \(trainMovement.expectedArrival)"
        } else {
            details = trainMovement.scheduledArrival
        }
        
        
        if trainMovement.scheduledDeparture != trainMovement.expectedDeparture {
            details += "\n\(trainMovement.scheduledDeparture) exp. \(trainMovement.expectedDeparture)"
        } else {
            details += "\n" + trainMovement.scheduledDeparture
        }
     
        detailTextLabel?.text = details
        
        if stationData.stationCode == trainMovement.locationCode {
            textLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            contentView.backgroundColor = .quaternarySystemFill
        } else {
            textLabel?.font = UIFont.systemFont(ofSize: 12)
            contentView.backgroundColor = .clear
        }
    }
}
