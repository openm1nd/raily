//
//  StationTableViewCell.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {
    var station: Station!
    
    func setup(_ station: Station) {
        self.station = station
        textLabel?.text = station.stationDesc
        detailTextLabel?.text = station.stationCode
    }
}
