//
//  FieldObservationDetailViewController.swift
//  Field Survey
//
//  Created by Jon Basa on 5/1/20.
//  Copyright © 2020 Jon Basa. All rights reserved.
//

import UIKit

class FieldObservationDetailViewController: UIViewController {

    var fieldObservation : Observation?
    
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var fieldObservationImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Observation"
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        if let fieldObservation = fieldObservation {
            titleLabel.text = fieldObservation.title
            dateLabel.text = dateFormatter.string(from: fieldObservation.date)
            fieldObservationImageView.image = UIImage(named: fieldObservation.classification.rawValue)
            descriptionLabel.text = fieldObservation.description
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
