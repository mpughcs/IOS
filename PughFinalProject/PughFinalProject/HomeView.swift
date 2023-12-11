//
//  HomeView.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/6/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \MedCD.name, ascending: true)]) var medsCD: FetchedResults<MedCD>
    
    @State private var dataChanged = false // State variable to track changes
    
    var body: some View {
        NavigationView {
            List {
                ForEach(medsCD, id: \.self) { med in
                    NavigationLink(destination: VStack {
                        MedicationDetail(selecectedMed: med)
                    }) {
                        HStack {
                            ListCell(med: med)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationBarTitle(Text("Medications"))
            .toolbar {
                EditButton()
            }
        }
        .onChange(of: dataChanged) { _ in
            // This block will be called when dataChanged changes
        }
        .id(dataChanged) // Force view update by changing its ID
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let med = medsCD[index]
            viewContext.delete(med)
        }
        do {
            try viewContext.save()
            dataChanged.toggle() // Toggle dataChanged to trigger view update
        } catch {
            let error = error as NSError
            fatalError("Unresolved error: \(error)")
        }
    }
}


struct ListCell: View {
    var colors: [Color] = [.blue, .orange, .red, .yellow, Color(red: 232/255, green: 213/255, blue: 211/255)]
    
    var shapes: [AnyView] = [
        AnyView(Circle().frame(width: 50, height: 50)),
        AnyView(Capsule().frame(width: 70, height: 30)),
        AnyView(Ellipse().frame(width: 50, height: 40))
    ]
    
    var med: FetchedResults<MedCD>.Element
    
    var body: some View{
        HStack{
            ZStack{
                shapes[Int(med.shape)]
                    .foregroundColor(colors[Int(med.color)])
                    .padding(.top, 6)
                    .padding(.horizontal, 5)
                    .shadow(color: .black, radius: 8, x: 5, y: 1)
                
            }.frame(height:65)
            Text(med.name ?? "no name").bold()
        }
        
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
