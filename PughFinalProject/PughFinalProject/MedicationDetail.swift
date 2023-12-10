//
//  MedicationDetail.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/9/23.
//

import Foundation
import SwiftUI

struct MedicationDetail: View {
    @State private var showingAlert = false
    
    var colors: [Color] = [.blue, .orange, .red, .yellow, Color(red: 232/255, green: 213/255, blue: 211/255)]
    
    var shapes: [AnyView] = [
        AnyView(Circle().frame(width: 50, height: 50)),
        AnyView(Capsule().frame(width: 70, height: 30)),
        AnyView(Ellipse().frame(width: 50, height: 40))
    ]
    
    init(selecectedMed: Medication){
        self.selectedMed = selecectedMed
        _showingAlert = State(initialValue: false)
    }
    
    
    let selectedMed: Medication
    
    var body: some View {
        Form{
            Section(header: Text("\(selectedMed.name)")){
                HStack{
                    Text("Color:")
                    shapes[selectedMed.shape]
                        .frame(width: 100, height: 100)
                        .scaleEffect(4)
                        .foregroundColor(colors[selectedMed.color])
                        .padding(.bottom, 100)
                        .shadow(color: .black, radius: 15, x: 20, y: 5)
                }
                HStack{
                    Text("Times a day:")
                    Text("\(selectedMed.timesADay)")
                }
                HStack{
                    Text("With food:")
                    if selectedMed.withFood{
                        Text("Yes")
                    }else{
                        Text("No")
                    }
                }
            }
            
        }
    }
    
    
}
