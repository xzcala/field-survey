//
//  FieldObservations.swift
//  Field Survey
//
//  Created by Jon Basa on 5/1/20.
//  Copyright © 2020 Jon Basa. All rights reserved.
//

import Foundation

enum Classification: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct Observation: Codable {
    var classification: Classification
    var title: String
    var description: String
    var date: Date
}

struct FieldObservations: Codable {
    var status: String
    var observations: [Observation]
}
