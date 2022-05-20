//
//  ContentView.swift
//  CurrencyExchanger
//
//  Created by Sie Feng Yie Farrel on 09/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var itemSelected = 0
    @State private var itemSelected2 = 1
    @State private var amount : String = " "
    private let currencies = ["IDR", "USD", "EUR", "JPY", "GBP", "CAD", "CHF", "AUD", "SGD", "RM", "PHP"]
    
    func convert(_ convert: String) -> String {
        var conversion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency = currencies[itemSelected]
        let to = currencies[itemSelected2]
        
        let idrRates = ["IDR": 1, "USD": 0.000068, "EUR": 1.0, "JPY": 0.0088, "GBP": 0.000056, "CAD": 0.000088, "CHF": 0.000068, "AUD": 0.000098, "SGD": 0.000095, "RM": 0.00030, "PHP": 0.0036]
        
        let usdRates = ["IDR": 14665.95, "USD": 1, "EUR": 0.96, "JPY": 129.27, "GBP": 0.82, "CAD": 1.29, "CHF": 1, "AUD": 1.44, "SGD": 1.39, "RM": 4.40, "PHP": 52.38]
        
        let euroRates = ["IDR": 15270.04, "USD": 1.04, "EUR": 1.0, "JPY": 134.54, "GBP": 0.85, "CAD": 1.34, "CHF": 1.04, "AUD": 1.50, "SGD": 1.45, "RM": 4.57, "PHP": 54.54]
        
        let jpyRates = ["IDR": 113.51, "USD": 0.0077, "EUR": 0.0074, "JPY": 1, "GBP": 0.0063, "CAD": 0.0100, "CHF": 0.0078, "AUD": 0.011, "SGD": 0.011, "RM": 0.034, "PHP": 0.41]
        
        let gbpRates = ["IDR": 17987.77, "USD": 1.23, "EUR": 1.18, "JPY": 158.54, "GBP": 1, "CAD": 1.58, "CHF": 1.23, "AUD": 1.77, "SGD": 1.71, "RM": 5.39, "PHP": 64.24]
        
        let cadRates = ["IDR": 11366.44, "USD": 0.78, "EUR": 0.74, "JPY": 100.18, "GBP": 0.63, "CAD": 1, "CHF": 0.78, "AUD": 1.12, "SGD": 1.08, "RM": 3.41, "PHP": 40.60]
        
        let chfRates = ["IDR": 14642.07, "USD": 1, "EUR": 0.96, "JPY": 129.05, "GBP": 0.81, "CAD": 1.29, "CHF": 1, "AUD": 1.44, "SGD": 1.39, "RM": 4.39, "PHP": 52.29]
        
        let audRates = ["IDR": 10170.18, "USD": 0.69, "EUR": 0.67, "JPY": 89.67, "GBP": 0.57, "CAD": 0.90, "CHF": 0.69, "AUD": 1, "SGD": 0.97, "RM": 3.05, "PHP": 36.32]
        
        let sgdRates = ["IDR": 10542.02, "USD": 0.72, "EUR": 0.69, "JPY": 92.92, "GBP": 0.59, "CAD": 0.93, "CHF": 0.72, "AUD": 1.04, "SGD": 1, "RM": 3.16, "PHP": 37.65]
        
        let rmRates = ["IDR": 3334.69, "USD": 0.23, "EUR": 0.22, "JPY": 29.45, "GBP": 0.19, "CAD": 0.29, "CHF": 0.23, "AUD": 0.33, "SGD": 0.32, "RM": 1, "PHP": 11.91]
        
        let phpRates = ["IDR": 279.99, "USD": 0.019, "EUR": 0.018, "JPY": 2.47, "GBP": 0.016, "CAD": 0.025, "CHF": 0.019, "AUD": 0.029, "SGD": 0.027, "RM": 0.084, "PHP": 1]
        
        
        switch (selectedCurrency) {
        case "IDR" : conversion = amount * (idrRates[to] ?? 0.0)
        case "USD" : conversion = amount * (usdRates[to] ?? 0.0)
        case "EUR" : conversion = amount * (euroRates[to] ?? 0.0)
        case "JPY" : conversion = amount * (jpyRates[to] ?? 0.0)
        case "GBP" : conversion = amount * (gbpRates[to] ?? 0.0)
        case "CAD" : conversion = amount * (cadRates[to] ?? 0.0)
        case "CHF" : conversion = amount * (chfRates[to] ?? 0.0)
        case "AUD" : conversion = amount * (audRates[to] ?? 0.0)
        case "SGD" : conversion = amount * (sgdRates[to] ?? 0.0)
        case "RM" : conversion = amount * (rmRates[to] ?? 0.0)
        case "PHP" : conversion = amount * (phpRates[to] ?? 0.0)


        default:
            print("something went wrong!")
        }
        
        return String(format: "%.2f", conversion)
    } 
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert a currency")){
                    TextField("Enter an amount", text: $amount).keyboardType(.decimalPad)
                    
                    Picker(selection: $itemSelected, label: Text("From")){
                        ForEach(0 ..< currencies.count) {
                            index in
                            Text(self.currencies[index]).tag(index)
                        }
                    }
                    
                    Picker(selection: $itemSelected2, label: Text("To")){
                        ForEach(0 ..< currencies.count) {
                            index in
                            Text(self.currencies[index]).tag(index)
                        }
                    }
                }
                
                Section(header: Text("Conversion")) {
                    Text("\(convert(amount)) \(currencies[itemSelected2])")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
