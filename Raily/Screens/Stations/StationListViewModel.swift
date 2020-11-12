//
//  StationListViewModel.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright (c) 2020 AppsBG. All rights reserved.
//

import UIKit

class StationListViewModel {
	weak var delegate: StationListDelegate? {
		didSet {
			getStations()
		}
	}
	
	var stations: [Station] = [] {
		didSet {
			DispatchQueue.main.async { [weak self] in
				self?.delegate?.stationsListChanged()
			}
		}
	}
	
    var lastKnownSearch: String?
 
    var showSearchBar: Bool = false {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.toggleSearchBar()
            }
        }
    }
    
    func getStations(search: String? = nil) {
        delegate?.willStartFetching()
        stations = []
        lastKnownSearch = search
        
		API.exec(endpoint: StationAPI.getAll, xmlPath: "ArrayOfObjStation.objStation", type: Station.self) { [weak self] (response, error) in
			if let data = response {
                var stations: [Station] = []
                if let s = search, s.count > 0 { // other way is to call the api each time with different endpoint - I assume that this is lighter solution
                    stations = data.filter{$0.stationDesc.lowercased().contains(s.lowercased()) }
                } else {
                    stations = data
                }
                self?.stations = stations.sorted(by: { (s1, s2) -> Bool in
                    return s1.stationDesc < s2.stationDesc
                })
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.stationsFetchComplete()
                }
            }
		}
	}
}
