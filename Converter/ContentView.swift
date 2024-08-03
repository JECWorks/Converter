//
//  ContentView.swift
//  Converter
//
//  Created by Jason Cox on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tempStart = 0.0
    @State private var tempConvert = 0.0
    @State private var unitStart = "Fahrenheit"
    @State private var unitConvert = "Celsius"
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    func convertTemperature() {
            // Add your conversion logic here
            // For example, converting from Celsius to Fahrenheit:
        if unitStart == "Celsius" && unitConvert == "Fahrenheit" {
            tempConvert = (tempStart * 9/5) + 32
            }
        if unitStart == "Fahrenheit" && unitConvert == "Celsius" {
            tempConvert = (tempStart - 32) * 5/9
            }
        if unitStart == "Celsius" && unitConvert == "Kelvin" {
            tempConvert = tempStart + 273.15
        }
        if unitStart == "Kelvin" && unitConvert == "Celsius" {
            tempConvert = tempStart - 273.15
        }
        if unitStart == "Fahrenheit" && unitConvert == "Kelvin" {
            tempConvert = ((tempStart - 32) * 5/9) + 273.15
            }
        if unitStart == "Kelvin" && unitConvert == "Fahrenheit" {
            tempConvert = (tempStart * 9/5) - 459.67
            }

        }

    
    var body: some View {
        NavigationStack {
            Form {
                Section("Starting temp") {
                    TextField("Starting value", value: $tempStart, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unit", selection: $unitStart) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section ("Converted temp") {
                    Text("\(tempConvert)")
                    
                    Picker("Unit", selection: $unitConvert) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Button("Convert") {
                    convertTemperature()
                }
            }
            .navigationTitle("Temperature Converter")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
