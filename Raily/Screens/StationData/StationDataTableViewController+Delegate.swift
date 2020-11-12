//
//  StationDataTableViewController+Delegate.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

protocol StationDataListDelegate: class {
    func stationDataFetchComplete()
    func stationDataListChanged()
    func willStartFetching()
}

extension StationDataTableViewController: StationDataListDelegate {
    func stationDataListChanged() {
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    func stationDataFetchComplete() {
        stopLoadingIndicator()
    }
    
    func willStartFetching() {
        startLoadingIndicator()
    }
}
