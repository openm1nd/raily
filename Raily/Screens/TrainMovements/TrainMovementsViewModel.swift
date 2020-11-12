//
//  TrainMovementsViewModel.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import Foundation

class TrainMovementsViewModel {
    weak var delegate: TrainMovementsDelegate? {
        didSet {
            getTrainMovements()
        }
    }
    
    var stationData: StationData!

    var trainMovements: [TrainMovement] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.trainMovementsListChanged()
            }
        }
    }

    func getCurrentStationMovement() -> Int? {
        let index = trainMovements.enumerated().filter({$1.locationCode == stationData.stationCode}).first?.offset
        return index
    }
    
    func getTrainMovements() {
        delegate?.willStartFetching()
        trainMovements = []
        let date = ""
        
        API.exec(endpoint: TrainAPI.getTrainMovements(stationData.trainCode, date), xmlPath: "ArrayOfObjTrainMovements.objTrainMovements", type: TrainMovement.self) { [weak self] (response, error) in
            if let data = response {
                self?.trainMovements = data
                
                DispatchQueue.main.async { [weak self] in
                    self?.delegate?.trainMovementsFetchComplete()
                }
            }
        }
    }
}
