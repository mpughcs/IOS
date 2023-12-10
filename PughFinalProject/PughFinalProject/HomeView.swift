//
//  HomeView.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/6/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var medicationStore: MedicationStore = MedicationStore()
    var body: some View {
        NavigationView{
            List{
                ForEach (medicationStore.meds) { med in
                    ListCell(med: med)
                    
                }.onDelete(perform: deleteItems)
                    .onMove(perform:moveItems)
            }
            .navigationBarTitle(Text("Medications"))
            .toolbar{
                EditButton()
                
            }

        }
    }
    func deleteItems(at offsets: IndexSet){
        medicationStore.meds.remove(atOffsets: offsets)
    }
    
//    this function moves items in the list
    func moveItems(from source: IndexSet, to destination: Int){
        medicationStore.meds.move(fromOffsets: source, toOffset: destination)
    }
}
struct ListCell: View {
    var med : Medication
    var body: some View{
        NavigationLink(destination: MedicationDetail(selecectedMed: med)){
            HStack{
                Image(systemName: "guitars.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
//                Text("\(guitar.brand) \(guitar.model)")
            }
            
        }
       
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
