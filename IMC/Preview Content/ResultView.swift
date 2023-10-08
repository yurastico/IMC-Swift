//
//  ResultView.swift
//  IMC
//
//  Created by Yuri Cunha on 08/10/23.
//

import SwiftUI

struct ResultView: View {
    @Binding var imc: Double
    let gender: Gender

    var result: String {
        switch imc {
        case 0..<16:
            return "Magreza"
        case 16..<18.5:
            return "Abaixo do peso"
        case 18.5..<25:
            return "Peso ideal"
        case 25..<30:
            return "Sobrepeso"
        default:
            return "Obesidade"
        }
    }

    var body: some View {
        VStack {
            Image("\(gender.rawValue)-\(result)")
                .resizable()
                .scaledToFit()
                .frame(height: 400)

            HStack(spacing: 2) {
                Text("O seu resultado de IMC é: **\(String(format: "%.2f", imc))**")
            }
            .font(.title2)

            Text(result)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.accentColor)

            Spacer()

            Button {
                imc = 0
            } label: {
                Text("Recalcular IMC")
                    .font(.system(.title3, weight: .bold))
                    .fontDesign(.rounded)
                    .frame(maxWidth: .infinity, minHeight: 40)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ResultView(imc: .constant(30), gender: .male)
}

#Preview {
    ResultView(imc: .constant(10), gender: .female)
}
