import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25]
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(amount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.white,.black]), startPoint: .top, endPoint: .bottom)
                Form{
                    Section{
                        TextField("Enter Your Amount", text: $amount)
                            .keyboardType(.decimalPad)
                        
                        Picker(selection: $numberOfPeople, label: Text("Number of People")){
                            ForEach(2 ..< 10){
                                Text("\($0) People")
                            }
                        }
                    .pickerStyle(DefaultPickerStyle())
                    }
                    
                    Section ( header: Text("How Much Tip You Would Like To Leave")){
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section{
                        Text("$\(String(totalPerPerson))")
                    }
                }
            }
            .navigationBarTitle("Split-It")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
