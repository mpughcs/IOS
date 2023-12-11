import SwiftUI

struct DailyView: View {
    @FetchRequest(sortDescriptors: []) var medsCD: FetchedResults<MedCD>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(medsCD, id: \.self) { med in
                    NavigationLink(destination: MedicationDetailView(medication: med)) {
                        HStack {
                            Text(med.name ?? "Unnamed Medication")
                            Spacer()
                            Text("\(med.timesADay) times a day")
                                .foregroundColor(med.timesADay > 0 ? .blue : .gray)
                        }
                    }
                }
            }
            .navigationTitle("Your Day")
        }
    }
}

struct MedicationDetailView: View {
    let medication: MedCD
    
    var body: some View {
        VStack {
            Text("Medication: \(medication.name ?? "Unknown")")
            Text("Take \(medication.timesADay) times a day")
        }
        .padding()
        .navigationTitle(medication.name ?? "Unknown")
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}

