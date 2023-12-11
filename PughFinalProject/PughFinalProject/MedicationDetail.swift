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
    let selectedMed: FetchedResults<MedCD>.Element

    
    var colors: [Color] = [.blue, .orange, .red, .yellow, Color(red: 232/255, green: 213/255, blue: 211/255)]
    
    var shapes: [AnyView] = [
        AnyView(Circle().frame(width: 50, height: 50)),
        AnyView(Capsule().frame(width: 70, height: 30)),
        AnyView(Ellipse().frame(width: 50, height: 40))
    ]
    
    init(selecectedMed: FetchedResults<MedCD>.Element){
        self.selectedMed = selecectedMed
        _showingAlert = State(initialValue: false)
    }
    
    
    
    var body: some View {
        Form{
            Section(header: Text("\(selectedMed.name ?? "unnnamed")")){
                VStack{

                    ZStack{
                        shapes[Int(selectedMed.shape)]
                            .frame(width: 100, height: 100)
                            .scaleEffect(4)
                            .foregroundColor(colors[Int(selectedMed.color)])
                            .padding(.horizontal, 100)
                            .shadow(color: .black, radius: 15, x: 20, y: 5)
                        if selectedMed.name!.count >= 2 {
                            Text(selectedMed.name!.prefix(2))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 15)
                        } else {
                            Text(selectedMed.name!)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.bottom, 100)
                        }
                    }.padding(50)
                    HStack{
                        Text("Times a day:")
                        Text("\(selectedMed.timesADay)")
                    }.padding()
                   
                }
            }
            
        }
    }
    
    
}
