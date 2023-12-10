//
//  Medication.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/9/23.
//

import Foundation
struct Medication : Codable, Identifiable{
    var id: String
    var name: String
    var shape: Int
    var color: Int
    var timesADay: Int
    var withFood: Bool
}

