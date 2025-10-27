//
//  Copyright © Kalisten 2021-2024
//

import KalistenTypography
import KalistenLayout
import KalistenColors
import KalistenCore

import SwiftUI

protocol LoadableObject: ObservableObject {
    var status: ActionStatus { get set }
}

protocol LoadableObjectAsync {
    var status: ActionStatus { get set }
}

struct SpinnerView: View {
    @Binding private var status: ActionStatus
    private var spinnerColor: Color
    private var font: Fonts

    init(
        status: Binding<ActionStatus> = .constant(.loading),
        spinnerColor: Color = Colors.Secondary.Mid.opaque,
        font: Fonts
    ) {
        self._status = status
        self.spinnerColor = spinnerColor
        self.font = font
    }

    @State private var isLoading: Bool = false

    var body: some View {
        Image(systemName: SFSymbols.arrowCircle)
            .styledIcon(
                color: spinnerColor,
                font: font
            )
            .shadow(color: .black.opacity(0.25), radius: 4, y: 2)
            .rotationEffect(
                Angle(degrees: isLoading ? 360 : 0))
            .animation(
                Animation.linear(duration: 1).repeatForever(autoreverses: false),
                value: isLoading
            )
            .onAppear {
                isLoading = true
            }
            .onDisappear {
                isLoading = false
            }
    }
}

// MARK: - Previews

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView(font: .button(.large))
        .padding()
        .background(Colors.Neutral.mid)
        .previewLayout(.sizeThatFits)
    }
}

// MARK: - Styles

private extension Image {
    func styledIcon(color: Color, font: Fonts) -> some View {
        let fontWeight = font == .label ? Font.Weight.bold : Font.Weight.regular
        let font = Font.system(size: font.size, weight: fontWeight)

        return self.renderingMode(.template)
            .font(font)
            .foregroundColor(color)
    }
}
