import SwiftUI

// This view is used to add a new medication to the list, it integrates with Core Data
struct AddMedicationView: View {
    // here we are creating a variable that will be used to access the Core Data
    @Environment (\.managedObjectContext) private var viewContext
    var colors: [Color] = [.blue, .orange, .red, .yellow, Color(red: 232/255, green: 213/255, blue: 211/255)]
    
    var shapes: [AnyView] = [
        AnyView(Circle().frame(width: 50, height: 50)),
        AnyView(Capsule().frame(width: 70, height: 30)),
        AnyView(Ellipse().frame(width: 50, height: 40))
    ]
    // here we are creating variables that will be used to store the data that the user inputs
    @State var selectedColor = 0
    @State var name:String = ""
    @State var selectedTime = 0
    @State var selectedShape = 0
    @State var timesPerDay = 0
    @State var isBlur: Bool = false
    @State var showMessage = false // State variable to control the message
    
    // this is the view that will be displayed
    var body: some View {
        ZStack{
            
            VStack {
                HStack(alignment: .center){
                    Text("Add Medication")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(40)
                }.padding(30)
                // this ZStack will display the shape and color that the user selects, with the name of the medication on top
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
                    Text("Name:")
                        .padding(25)
                    TextField("Enter Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(alignment: .leading)
                        .onChange(of: name) { _ in
                            print("Name changed to \(name)")
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
                                    .frame(alignment:.leading)
                                    .foregroundColor(colors[selectedColor])
                            }
                            .padding(14)
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: selectedShape == index ? 4 : 0)
                            ).padding(2)
                        }
                    }
                } .frame(alignment:.leading)
                
                
                HStack {
                    Stepper(value: $timesPerDay, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                        Text("Times per day:")
                        Text(timesPerDay.description).font(.title)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: name) { _ in
                        print("Name changed to \(name)")
                    }
                    
                    
                }.frame(alignment: .leading)
                    .padding(25)
                
                
                
            }
            .padding(.bottom, 50)
            .modifier(BlurModifierSimple(showOverlay: $isBlur))
            
            HStack{
                Button(action: {
                    addNewMedication()
                    self.showMessage = true // Show the message
                    self.isBlur = true // Blur the background
                    
                    delay(interval: 1.5) { // Hide the message after 1.5 seconds
                        selectedColor = 0
                        name = ""
                        selectedTime = 0
                        selectedShape = 0
                        timesPerDay = 0
                        self.showMessage = false
                        self.isBlur = false // Remove the blur
                        // Reset other states if needed
                    }
                }) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(40)
                    if showMessage {
                        Text("Successfully added")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .animation(.easeInOut)
                            .transition(.opacity)
                            .zIndex(1) // Ensure it's on top of other views
                    }
                }
            }.padding(.top, 675)
            
            
        }
    }
    // this function adds the new medication to the Core Data
    func addNewMedication(){
       
        let newMedCD = MedCD(context: viewContext)
        newMedCD.name = name
        newMedCD.color = Int32(selectedColor)
        newMedCD.shape = Int32(selectedShape)
        newMedCD.timesADay = Int32(timesPerDay)
        
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("unresolved error: \(error)")
        }
        
        
    }
}



// this struct is used to blur the background when the user is adding a new medication
struct BlurModifierSimple: ViewModifier {
    @Binding var showOverlay: Bool
    @State var blurRadius: CGFloat = 10
    
    func body(content: Content) -> some View {
        Group {
            content
                .blur(radius: showOverlay ? blurRadius : 0)
                .animation(.easeInOut(duration:0.4))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
// this function is used to delay the message that is displayed when the user adds a new medication
func delay(interval: TimeInterval, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: closure)
}

struct AddMedicationView_Previews: PreviewProvider {
    static var previews: some View {
        AddMedicationView()
    }
}
