//
//  StationDataTableViewController+Delegate.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

protocol TrainMovementsDelegate: class {
    func trainMovementsFetchComplete()
    func trainMovementsListChanged()
    func willStartFetching()
}

extension TrainMovementsTableViewController: TrainMovementsDelegate {
    func trainMovementsListChanged() {
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    func trainMovementsFetchComplete() {
        stopLoadingIndicator()
        
        if let index = viewModel.getCurrentStationMovement() {
            tableView.scrollToRow(at: IndexPath(item: index, section: 0), at: .middle, animated: true)
        }
    }
    
    func willStartFetching() {
        startLoadingIndicator()
    }
}
