//
//  Medication.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/9/23.
//

import Foundation
// this is the medication class that will be used to ease the process of saving the data between coredat and swiftui
struct Medication : Codable, Identifiable{
    var id: String
    var name: String
    var shape: Int
    var color: Int
    var timesADay: Int
    var withFood: Bool
}

