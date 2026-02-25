//
//  PeopleRow.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct PeopleRow: View {
    
    @Binding var people: Int

    var body: some View {
        HStack {
            Text("# of people")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.6))

            Spacer()

            HStack(spacing: 0) {
                StepperButton(symbol: "minus") {
                    people = max(1, people - 1)
                }

                Text("\(people)")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.9))
                    .frame(width: 56, height: 44)
                    .background(.white.opacity(0.08))
                    .overlay(
                        Rectangle()
                            .fill(.white.opacity(0.14))
                            .frame(width: 1)
                            .frame(maxHeight: .infinity),
                        alignment: .leading
                    )
                    .overlay(
                        Rectangle()
                            .fill(.white.opacity(0.14))
                            .frame(width: 1)
                            .frame(maxHeight: .infinity),
                        alignment: .trailing
                    )

                StepperButton(symbol: "plus") {
                    people = min(99, people + 1)
                }
            }
            .background(.white.opacity(0.10))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.white.opacity(0.16), lineWidth: 1)
            )
        }
        .padding(.top, 2)
    }
}

#Preview {
    VStack {
        PeopleRow(people: .constant(1))
    }
    .background(Color.yellow)
    .padding(20)
}
