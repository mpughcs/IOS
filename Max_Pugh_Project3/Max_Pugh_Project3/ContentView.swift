//
//  ContentView.swift
//  Max_Pugh_Project3
//
//  Created by Max Pugh on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
            TabView{
                FirstTabView()
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("screen one")
                    }
                SecondTabView()
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("screen two")
                    }
                ThirdTabView()
                    .tabItem{
                        Image(systemName: "3.circle")
                        Text("Screen 3")
                    }
                
                
            }
                .tabViewStyle(DefaultTabViewStyle())
                .animation(.easeInOut) // 2
                .transition(.slide) // 3
            
            
        
        
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
