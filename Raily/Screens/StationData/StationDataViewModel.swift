//
//  StationDataViewModel.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation

class StationDataViewModel {
    weak var delegate: StationDataListDelegate? {
        didSet {
            getStationData()
        }
    }
    
    var station: Station!
    var stationData: [StationData] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.stationDataListChanged()
            }
        }
    }

    
    func getStationData() {
        delegate?.willStartFetching()
        stationData = []
        
        API.exec(endpoint: StationAPI.getDataByName(station.stationDesc), xmlPath: "ArrayOfObjStationData.objStationData", type: StationData.self) { [weak self] (response, error) in
            if let data = response {
                self?.stationData = data.sorted(by: { (s1, s2) -> Bool in
                    return s1.trainDate < s2.trainDate
                })
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.stationDataFetchComplete()
                }
            }
        }
    }
}
