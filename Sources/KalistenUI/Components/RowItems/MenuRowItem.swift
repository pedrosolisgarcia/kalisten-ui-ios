//
//  MenuRowItem.swift
//  KalistenUI
//
//  Created by Pedro Solís García on 5/8/25.
//

import KalistenTypography
import KalistenColors
import KalistenLayout

import SwiftUI

public struct MenuRowItem: View {
    private let image: ImageType
    private let label: LocalizedStringKey
    private let action: () -> Void

    public init(image: ImageType, label: LocalizedStringKey, action: @escaping () -> Void) {
        self.image = image
        self.label = label
        self.action = action
    }

    public var body: some View {
        Button {
            withAnimation {
                action()
            }
        } label: {
            CardView(cornerRadius: .base) {
                HStack(spacing: .small) {
                    switch image {
                    case .asset(let imageName):
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Colors.Secondary.light)
                            .frame(width: .medium, height: .medium)
                    case .sfSymbol(let symbolName):
                        Image(systemName: symbolName)
                            .foregroundColor(Colors.Secondary.light)
                            .fontStyle(.subtitle)
                    case .emoji(let emojiSymbol):
                        Rectangle()
                            .foregroundColor(Colors.Secondary.light)
                            .mask(
                                Text(emojiSymbol.rawValue)
                                    .fontStyle(.subtitle)
                            )
                            .frame(width: .medium)
                    }
                    Text(label)
                        .fontStyle(.button(.large))
                        .foregroundColor(Colors.Secondary.light)
                    Spacer()
                }
                .padding()
            }
        }
    }
}
