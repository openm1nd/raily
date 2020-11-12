//
//  TrainMovements.swift
//  Raily
//
//  Created by Dimitar Marinov on 12.11.20.
//  Copyright © 2020 AppsBG. All rights reserved.
//

import UIKit

class TrainMovementsTableViewController: UITableViewController {
    var viewModel: TrainMovementsViewModel!
    
    func setup(stationData: StationData) {
        viewModel = TrainMovementsViewModel()
        viewModel.stationData = stationData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        navigationItem.title = viewModel.stationData.origin + " > " + viewModel.stationData.destination
        navigationItem.prompt = viewModel.stationData.trainCode
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.trainMovements.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainMovementTableViewCell", for: indexPath) as! TrainMovementTableViewCell
        let trainMovement = viewModel.trainMovements[indexPath.row]
        cell.setup(trainMovement: trainMovement, stationData: viewModel.stationData)
        // Configure the cell...

        return cell
    }
    
    @IBAction func onDoneTapped() {
        dismiss(animated: true, completion: nil)
    }
}
