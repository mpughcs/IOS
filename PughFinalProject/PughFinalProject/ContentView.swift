//
//  ContentView.swift
//  PughFinalProject
//
//  Created by Max Pugh on 12/6/23.
//

import SwiftUI
// this is the main view that will be displayed when the app is opened
struct ContentView: View {
    
    @StateObject var medicationStore: MedicationStore = MedicationStore()
    @Environment(\.managedObjectContext) private var viewContext
    
    
    
    var body: some View {
        NavigationView{
            TabView{
                DailyView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Daily")
                    }
                HomeView()
                    .tabItem{
                        Image(systemName: "list.bullet.rectangle.fill")
                        Text("Overview")
                    }
                AddMedicationView()
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Medication")
                    }
                
                
            }
                .tabViewStyle(DefaultTabViewStyle())
                .accentColor(.green)
                .animation(.easeInOut) // 2
                .transition(.slide) // 3
                
            
        }
            
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
