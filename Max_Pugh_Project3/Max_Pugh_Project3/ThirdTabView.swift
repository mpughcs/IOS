//
//  ThirdTabView.swift
//  Max_Pugh_Project3
//
//  Created by Max Pugh on 11/15/23.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ThirdTabView: View {
        
    @State private var isSpinning: Bool = true
    @State private var ballColor = Color.blue
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                .foregroundColor(.white)
            
            VStack{
                Text("Double tap").font(.largeTitle)
                ZStack{
                    Circle()
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color.blue)
                        .frame(width: 21, height: 360)
                    Image(systemName: "clock.fill") .font(.largeTitle)
                        .foregroundColor(ballColor)
                        .offset(y: -120) .rotationEffect(.degrees(isSpinning ? 90 : 270))
                        .animation(Animation.easeInOut(duration: 1) .repeatForever(autoreverses: true))
                }
                
            }
            
            
        }.onAppear() { self.isSpinning.toggle()}
            .onTapGesture(count: 2){
                print("tapped")
                ballColor = ballColor == Color.blue ? Color.red : Color.blue
            }
    }
}

struct ThirdTabView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdTabView()
    }
}
