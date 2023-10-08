//
//  ContentView.swift
//  IMC
//
//  Created by Yuri Cunha on 04/10/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Calculadora de IMC")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
            
            Image("Male1")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 260)
            
            
            
            HStack(spacing: 40) {
                Button("FluminenC") {
                    print("FLU")
                }
                .font(.title3)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                Button("Framengo") {
                    print("FLA")
                }
            }
            
            Spacer()
        }
       
    }
}

#Preview {
    ContentView()
}

