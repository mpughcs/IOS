//
//  MedicationStore.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/9/23.
//

import Foundation
import Combine

//this class keeps an array of guitar objects to be shown to the user.
class MedicationStore: ObservableObject {
    @Published var meds:[Medication]
    init(meds:[Medication] = []){
        self.meds = meds
    }
}
