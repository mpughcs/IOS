//
//  FirstTabView.swift
//  Max_Pugh_Project3
//
//  Created by Max Pugh on 11/15/23.
//

import SwiftUI

//struct FirstTabView: View {
//    let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
//    @State var circleSize: CGFloat = 140
//    @State var scale: CGFloat = 1.0
//    @GestureState private var offset :CGSize = .zero
//
//
//    func expand(){
//        circleSize = circleSize == 140 ? 190 : 140
//    }
//
//    var body: some View {
//        let drag = DragGesture()
//            .updating($offset) { dragValue, state, transaction in
//                state = dragValue.translation
////                print(state)
//            }
//
//        ZStack{
//            Button("Tap") {
//                //                expand()
//            }
//            Circle()
//            //                .stroke(lineWidth: 30)
//                .foregroundStyle(RadialGradient(gradient: colors, center: .center, startRadius: 10, endRadius: 200))
//                .backgroundStyle(Color.black)
//                .frame(width: 200, height: circleSize)
//                .padding()
//                .animation(.easeInOut(duration: 3))
//                .scaleEffect(scale)
//                .gesture(drag)
//                .offset(offset)
//            RoundedRectangle(cornerRadius: CGFloat(20))
//                .stroke(style: StrokeStyle(lineWidth: 10, dash: [10]))
//                .foregroundColor(.blue)
//                .frame(width: 200, height: 200)
//                .padding()
//
//        }
//
//    }
//}
struct FirstTabView: View {
    @State private var magnification : CGFloat = 1
    @GestureState private var offset :CGSize = .zero
    let colors = Gradient(colors: [.green, .yellow])
    @State var buttonText = "Grow"
    @State var textSize : CGFloat = 20.0
    func shake(){
        withAnimation(.easeInOut(duration: 0.5)){
            magnification = magnification == 1 ? 1.5 : 1
            buttonText = buttonText == "Grow" ? "Shrink" : "Grow"
            textSize = textSize == 20.0 ? 30.0 : 20.0

        }
    }
    var body: some View  {
        let drag = DragGesture()
            .updating($offset) { dragValue, state, transaction in
                state = dragValue.translation
            }
        
        return VStack{
            ZStack{
                
                
                Circle()
                    .scale(magnification)
                
                    .frame(width: 200)
                   
                //                .animation(.easeInOut(duration: 1))
                Text("Drag Me")
                    .font(.system(size:textSize))
                    .animation(.default)
                    .foregroundColor(.black)
                    .font(.largeTitle)

                
            }.offset(offset)
                .gesture(drag)
                .animation(.interpolatingSpring(stiffness: 100, damping: 10))
                
            Button(buttonText) {
                shake()
            }
            .padding(.bottom, 70)
            .padding()
            .font(.largeTitle)
            .buttonStyle(.borderless)
        }.foregroundStyle(RadialGradient(gradient: colors, center: .center, startRadius: 10, endRadius: 200))
        
    }
    
}



struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}

struct triangle : Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        return path
    }
}
