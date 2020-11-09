//
//  FieldObservationsViewController.swift
//  Field Survey
//
//  Created by Jon Basa on 5/1/20.
//  Copyright © 2020 Jon Basa. All rights reserved.
//

import UIKit

class FieldObservationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var fieldObservationsTableView: UITableView!
    
    var dateFormatter = DateFormatter()
    
    let jsonFileName = "field_observations"
    var fieldObservations: FieldObservations?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        fieldObservations = FieldObservationsLoader.load(jsonFileName: jsonFileName)
        
        if fieldObservations == nil {
            let alertController = UIAlertController(title: "Alert", message: "Unable to load and parse \(jsonFileName).json", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        
        self.title = "Field Observations"
        fieldObservationsTableView.rowHeight = 75
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldObservations?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fieldObservationsTableView.dequeueReusableCell(withIdentifier: "fieldObservationCell", for: indexPath)
        
        if let cell = cell as? FieldObservationTableViewCell,
            let fieldObservation = fieldObservations?.observations[indexPath.row] {
            cell.titleLabel.text = fieldObservation.title
            cell.dateLabel.text = dateFormatter.string(from: fieldObservation.date)
            cell.fieldObservationImageView.image = UIImage(named: fieldObservation.classification.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldObservationDetailViewController,
            let selectedIndexPath = fieldObservationsTableView.indexPathForSelectedRow {
            destination.fieldObservation = fieldObservations?.observations[selectedIndexPath.row]
        }
    }
    
}
