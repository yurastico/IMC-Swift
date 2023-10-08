//
//  ContentView.swift
//  IMC
//
//  Created by Yuri Cunha on 04/10/23.
//

import SwiftUI

enum Gender: String {
    case male = "Masculino"
    case female = "Feminino"
}

struct ContentView: View {
    @State private var height: Int = 180
    @State private var weight: Int = 70
    @State private var gender: Gender = .male
    @State private var imc: Double = 0

    var body: some View {
        if imc != 0 {
            //ResultView(imc: $imc, gender: gender)

        } else {
            VStack {
                title
                image
                genderButtons
                MeasureView(image: "pencil.and.ruler", text: "Altura (cm)", value: $height)
                MeasureView(image: "scalemass", text: "Peso (kg)", value: $weight)
                Spacer()
                Button {
                    calculate()
                } label: {
                    Text("Calcular IMC")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                        .frame(maxWidth: .infinity, minHeight: 40)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
    
    private var selectedGenderImage: String {
        gender == .male ? "Homem-Peso ideal" : "Mulher-Peso ideal"
    }

    private var title: some View {
        Text("Calculadora de IMC")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
    }

    private var image: some View {
        Image(selectedGenderImage)
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 260)
    }

    private var genderButtons: some View {
        HStack(spacing: 40) {
            GenderButton(gender: .male, selectedGender: $gender)
            GenderButton(gender: .female, selectedGender: $gender)
        }
        .padding(.bottom, 20)
    }

    private func calculate() {
        imc = Double(weight) / (Double(height * height) / 10000)
    }

}

struct MeasureView: View {
    let image: String
    let text: String
    @Binding var value: Int

    var body: some View {
        HStack {
            Image(systemName: image)
            Text(text)

            Spacer()

            Button {
                value -= 1
            } label: {
                Image(systemName: "minus.circle.fill")
            }

            Text("\(value)")
                .font(.title2)
                .fontWeight(.bold)
                .frame(width: 50)

            Button {
                value += 1
            } label: {
                Image(systemName: "plus.circle.fill")
            }

        }
        .padding()
        .background(.background)
        .cornerRadius(6)
        .shadow(color: Color(white: 0.9), radius: 6)
        .padding(.vertical, 2)
    }
}

struct GenderButton: View {
    let gender: Gender
    @Binding var selectedGender: Gender

    var body: some View {
        Button(gender.rawValue) {
            selectedGender = gender
        }
        .font(.title3)
        .fontWeight(.semibold)
        .fontDesign(.rounded)
        .opacity(selectedGender == gender ? 1.0 : 0.3)
    }
}


#Preview {
    ContentView()
}

