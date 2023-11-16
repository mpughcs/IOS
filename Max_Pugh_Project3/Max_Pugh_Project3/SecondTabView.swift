//
//  SecondTabView.swift
//  Max_Pugh_Project3
//
//  Created by Max Pugh on 11/15/23.
//

import SwiftUI

struct SecondTabView: View {
    @State private var angle: Double = 0
    @State private var scale: CGFloat = 1.0


    var body: some View {
        VStack{
            
            
            Button("Press and Pinch") {
                angle += 15
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            .background(Color.pink.cornerRadius(10))
            .scaleEffect(scale)
            .gesture(MagnificationGesture(minimumScaleDelta: 0.4)
                .onChanged { scale in
                    self.scale = scale.magnitude
                }
            )
            .padding()
            .rotationEffect(.degrees(angle))
            .animation(.interpolatingSpring(mass: 1, stiffness: 1000, damping: 5, initialVelocity: 35), value: angle)
            
            Button("Reset") {
                angle = 0
                
            }
        }
    }
}
struct SecondTabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTabView()
    }
}
