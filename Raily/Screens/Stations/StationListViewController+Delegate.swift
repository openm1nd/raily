//
//  StationListViewController+Delegate.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

protocol StationListDelegate: class {
	func stationsFetchComplete()
    func stationsListChanged()
    func willStartFetching()
    func toggleSearchBar()
}

extension StationListViewController: StationListDelegate {
	func stationsListChanged() {
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
	}
	
	func stationsFetchComplete() {
		stopLoadingIndicator()
	}
    
    func willStartFetching() {
        startLoadingIndicator()
    }
	
    func toggleSearchBar() {
        if (!viewModel.showSearchBar) {
            viewModel.getStations()
            tableView.tableHeaderView = nil
            searchBar.resignFirstResponder()
            tableView.reloadData()

        } else {
            searchBar.text = ""
            tableView.tableHeaderView = searchBar
            searchBar.becomeFirstResponder()
            tableView.setContentOffset(.init(x: 0, y: -64), animated: false)
            tableView.reloadData()

        }
    }
}
