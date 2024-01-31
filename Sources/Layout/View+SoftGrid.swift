//
//  View+CustomGrid.swift
//  Kalisten
//
//  Created by Pedro Solis Garcia on 30/08/21.
//  Copyright © 2021 VILHON Technologies. All rights reserved.
//
//  swiftlint:disable identifier_name
//

import SwiftUI

// MARK: - View

public extension View {

    // MARK: CornerRadius
    func cornerRadius(_ radius: SoftGrid, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius.rawValue, corners: corners))
    }

    func cornerRadius(_ radius: SoftGrid, antialiased: Bool = true) -> some View {
        self.cornerRadius(radius.rawValue, antialiased: antialiased)
    }

    // MARK: Frame
    func frame(width: SoftGrid, height: SoftGrid, alignment: Alignment = .center) -> some View {
        self.frame(width: width.rawValue, height: height.rawValue, alignment: alignment)
    }

    func frame(width: SoftGrid, height: SoftGrid? = nil, alignment: Alignment = .center) -> some View {
        self.frame(width: width.rawValue, height: height?.rawValue, alignment: alignment)
    }

    func frame(width: SoftGrid? = nil, height: SoftGrid, alignment: Alignment = .center) -> some View {
        self.frame(width: width?.rawValue, height: height.rawValue, alignment: alignment)
    }

    func frame(minWidth: SoftGrid, minHeight: SoftGrid, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: minWidth.rawValue, minHeight: minHeight.rawValue, alignment: alignment)
    }

    func frame(minWidth: SoftGrid, minHeight: SoftGrid? = nil, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: minWidth.rawValue, minHeight: minHeight?.rawValue, alignment: alignment)
    }

    func frame(minWidth: SoftGrid? = nil, minHeight: SoftGrid, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: minWidth?.rawValue, minHeight: minHeight.rawValue, alignment: alignment)
    }

    func frame(maxWidth: SoftGrid, maxHeight: SoftGrid, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth.rawValue, maxHeight: maxHeight.rawValue, alignment: alignment)
    }

    func frame(maxWidth: SoftGrid, maxHeight: SoftGrid? = nil, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth.rawValue, maxHeight: maxHeight?.rawValue, alignment: alignment)
    }

    func frame(maxWidth: SoftGrid? = nil, maxHeight: SoftGrid, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth?.rawValue, maxHeight: maxHeight.rawValue, alignment: alignment)
    }

    // MARK: LineSpacing
    func lineSpacing(_ lineSpacing: SoftGrid) -> some View {
        self.lineSpacing(lineSpacing.rawValue)
    }

    // MARK: Offset
    func offset(x: SoftGrid = .zero, y: SoftGrid = .zero) -> some View {
        self.offset(x: x.rawValue, y: y.rawValue)
    }

    // MARK: Padding
    func padding(_ edges: Edge.Set, _ length: SoftGrid) -> some View {
        self.padding(edges, length.rawValue)
    }

    func padding(_ edges: Edge.Set) -> some View {
        self.padding(edges, .small)
    }

    func padding( _ length: SoftGrid) -> some View {
        self.padding(.all, length)
    }

    func padding() -> some View {
        self.padding(.all, .small)
    }

    // MARK: Shadow
    func shadow(
        color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33),
        radius: SoftGrid,
        x: SoftGrid = .zero,
        y: SoftGrid = .zero
    ) -> some View {
        self.shadow(color: color, radius: radius.rawValue, x: x.rawValue, y: y.rawValue)
    }
}

// MARK: - Stacks

public extension HStack {
    init?(alignment: VerticalAlignment = .center, spacing: SoftGrid, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}

public extension VStack {
    init?(alignment: HorizontalAlignment = .center, spacing: SoftGrid, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}

public extension LazyVGrid {
    init?(columns: [GridItem], spacing: SoftGrid, @ViewBuilder content: () -> Content) {
        self.init(columns: columns, spacing: spacing.rawValue, content: content)
    }
}

// MARK: - Spacer

public extension Spacer {
    init?(minLength: SoftGrid) {
        self.init(minLength: minLength.rawValue)
    }
}

// MARK: - Shapes

public extension Shape {
    func stroke<S>(_ content: S, lineWidth: SoftGrid = .unit) -> some View where S: ShapeStyle {
        self.stroke(content, lineWidth: lineWidth.rawValue)
    }
}

public extension RoundedRectangle {
    init(cornerRadius: SoftGrid, style: RoundedCornerStyle = .circular) {
        self.init(cornerRadius: cornerRadius.rawValue, style: style)
    }
}

// MARK: - Helpers

private struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
