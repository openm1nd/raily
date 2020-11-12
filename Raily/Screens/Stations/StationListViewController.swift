//
//  StationListViewController.swift
//  Raily
//
//  Created by Dimitar Marinov on 11.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit 
import MapKit

class StationListViewController: UITableViewController {
	let viewModel = StationListViewModel()
    @IBOutlet weak var searchToggle: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
        title = "Select a station to view the schedule"
		viewModel.delegate = self
		NotificationCenter.default.addObserver(forName: NSNotification.Name(Constants.willEnterForeground), object: nil, queue: OperationQueue.main) { [weak self](_) in
            self?.viewModel.getStations(search: self?.viewModel.lastKnownSearch)
		}
	}
	 
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? StationTableViewCell, let dest = segue.destination as? StationDataTableViewController {
            dest.setup(station: cell.station)
		}
	}
} 

extension StationListViewController: UISearchBarDelegate {
    func doSearch() {
        if searchBar.text?.count == 0 {
            viewModel.showSearchBar = false
            viewModel.getStations()
        } else {
            viewModel.getStations(search: searchBar.text)
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        doSearch()
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        doSearch()
    }
    
    @IBAction func toggleSearch(_ sender: Any) {
        viewModel.showSearchBar = !viewModel.showSearchBar
    }
}

extension StationListViewController: UICollectionViewDelegateFlowLayout {
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationTableViewCell") as! StationTableViewCell
        cell.setup(viewModel.stations[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stations.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let station = viewModel.stations[indexPath.row]
        
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: station.stationLatitude, longitude: station.stationLongitude)))
        source.name = station.stationDesc
 
        MKMapItem.openMaps(with: [source], launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsMapCenterKey])
    }
    
}
