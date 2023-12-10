import SwiftUI

struct AddMedicationView: View {
//    232, 213, 211
    var colors: [Color] = [.blue, .orange, .red, .yellow, Color(red: 232/255, green: 213/255, blue: 211/255)]
    
    var shapes: [AnyView] = [
        AnyView(Circle().frame(width: 50, height: 50)),
        AnyView(Capsule().frame(width: 70, height: 30)),
        AnyView(Ellipse().frame(width: 50, height: 40))
    ]
    
    @State var selectedColor = 0
    @State var name:String = ""
    @State var selectedTime = 0
    @State var selectedShape = 0
    init() {
        print("View Initialized")
    }
    var body: some View {
        VStack {
            HStack(alignment: .center){
                Text("Add Medication")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 200)
            }
            ZStack{
                shapes[selectedShape]
                    .frame(width: 100, height: 100)
                    .scaleEffect(4)
                    .foregroundColor(colors[selectedColor])
                    .padding(.bottom, 100)
                    .shadow(color: .black, radius: 15, x: 20, y: 5)
                if name.count >= 2 {
                    Text(name.prefix(2))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 100)
                } else {
                    Text(name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 100)
                }
            }
            
            HStack {
                Text("Color:")
                ForEach(0..<5) { index in
                    VStack {
                        Button(action: {
                            selectedColor = index
                            print(selectedColor)
                        }) {
                            EmptyView()
                        }
                        .padding()
                        .background(colors[index])
                        .clipShape(Rectangle())
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                        .overlay(
                            Rectangle()
                                .foregroundColor(.clear)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedColor = index
                                    print(selectedColor)
                                }
                        )
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: selectedColor == index ? 4 : 0)
                        )
                    }
                }
            }
            HStack(){
                Text("Shape:")
                ForEach(0..<3) { index in
                    VStack {
                        Button(action: {
                            selectedShape = index
                            print("Selected Shape: \(selectedShape)")
                        }) {
                            shapes[index]
                                .frame(width: 20, height: 20)
                                .foregroundColor(colors[selectedColor])
                        }
                        .padding(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: selectedShape == index ? 4 : 0)
                        )
                    }
                }
            }
            HStack {
                Text("Name:")
                    .padding(25)
                TextField("Enter Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:150, alignment: .leading)
                    .onChange(of: name) { _ in
                        print("Name changed to \(name)")
                    }
                    
                Spacer()
                Button(action: {
                  addNewMedication()
                }) {
                    Image(systemName:"checkmark.circle.fill")
                        
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(40)

                }
                .padding()
            }
//            submit button
           
        }
    }
    func addNewMedication(){
        let newMedication = Medication(id:UUID().uuidString, name: name, shape: selectedShape, color: selectedColor, timesADay: 1, withFood: true)
        print("New Medication: \(newMedication)")
    }
}

struct AddMedicationView_Previews: PreviewProvider {
    static var previews: some View {
        AddMedicationView()
    }
}

