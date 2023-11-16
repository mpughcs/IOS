//
//  ThirdTabView.swift
//  Max_Pugh_Project3
//
//  Created by Max Pugh on 11/15/23.
//

import SwiftUI

struct ThirdTabView: View {
    @State private var angle = Angle(degrees: 0.0)
    
    @State private var isSpinning: Bool = true
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(Color.blue)
                .frame(width: 360, height: 360)
            Image(systemName: "forward.fill") .font(.largeTitle)
                .offset(y: -180) .rotationEffect(.degrees(isSpinning ? 0 : 360))
                .animation(Animation.linear(duration: 0.2) .repeatForever(autoreverses: false))
        }.onAppear() { self.isSpinning.toggle()}
    }
}

struct ThirdTabView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdTabView()
    }
}
