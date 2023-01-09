//
//  ContentView.swift
//  GroundStyles
//
//  Created by Maris Lagzdins on 09/01/2023.
//

import SwiftUI

// MARK: - Toggle Shape

struct CheckmarkToggleStyle: ToggleStyle {
    private let tint: TintShapeStyle = .tint

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark" : "square")
                .resizable()
                .symbolVariant(configuration.isOn ? .square.fill : .none)
                .frame(width: 24, height: 24)
                .foregroundStyle(tint)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

extension ToggleStyle where Self == CheckmarkToggleStyle {
    static var checkmark: Self { .init() }
}

// MARK: - Button Shape

struct AccentButton: ButtonStyle {
    private let tint: TintShapeStyle = .tint

    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            configuration.label

            Rectangle()
                .fill(tint)
                .frame(height: 2)
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

extension ButtonStyle where Self == AccentButton {
    static var accent: Self { .init() }
}

// MARK: - Content View

struct ContentView: View {
    @State private var isUpdatesEnabled: Bool = false
    @State private var isTermsAndConditionsEnabled: Bool = false

    var body: some View {
        Form {
            Section {
                Toggle("Daily updates", isOn: $isUpdatesEnabled)

                Toggle("Terms and Conditions", isOn: $isTermsAndConditionsEnabled)
                    .toggleStyle(.checkmark)
            }

            Section {
                Text("Text: Tint has no effect")

                Button("Plain Button: Tint has no effect") {
                    // do nothing
                }
                .buttonStyle(.plain)

                Button("Bordered Button: Tint colors the background") {
                    // do nothing
                }
                .buttonStyle(.bordered)

                Button("Bordered Prominent Button: Tint colors the background") {
                    // do nothing
                }
                .buttonStyle(.borderedProminent)

                Image(systemName: "star")

                Label("Label: Tint has no effect", systemImage: "sun.max")
            }

            Section {
                Button("Custom button") {
                    // do nothing
                }
                .buttonStyle(.accent)
            }
        }
        .tint(.orange)
        .foregroundStyle(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
