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

public extension Shape {
    func stroke<S>(_ content: S, lineWidth: Grid = .unit) -> some View where S: ShapeStyle {
        self.stroke(content, lineWidth: lineWidth.rawValue)
    }
}

public extension View {
    func cornerRadius(_ radius: Grid, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius.rawValue, corners: corners))
    }

    func cornerRadius(_ radius: Grid, antialiased: Bool = true) -> some View {
        self.cornerRadius(radius.rawValue, antialiased: antialiased)
    }

    func frame(width: Grid, height: Grid, alignment: Alignment = .center) -> some View {
        self.frame(width: width.rawValue, height: height.rawValue, alignment: alignment)
    }

    func frame(width: Grid, height: Grid? = nil, alignment: Alignment = .center) -> some View {
        self.frame(width: width.rawValue, height: height?.rawValue, alignment: alignment)
    }

    func frame(width: Grid? = nil, height: Grid, alignment: Alignment = .center) -> some View {
        self.frame(width: width?.rawValue, height: height.rawValue, alignment: alignment)
    }

    func frame(minWidth: Grid, minHeight: Grid, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: minWidth.rawValue, minHeight: minHeight.rawValue, alignment: alignment)
    }

    func frame(minWidth: Grid, minHeight: Grid? = nil, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: minWidth.rawValue, minHeight: minHeight?.rawValue, alignment: alignment)
    }

    func frame(minWidth: Grid? = nil, minHeight: Grid, alignment: Alignment = .center) -> some View {
        self.frame(minWidth: minWidth?.rawValue, minHeight: minHeight.rawValue, alignment: alignment)
    }

    func frame(maxWidth: Grid, maxHeight: Grid, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth.rawValue, maxHeight: maxHeight.rawValue, alignment: alignment)
    }

    func frame(maxWidth: Grid, maxHeight: Grid? = nil, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth.rawValue, maxHeight: maxHeight?.rawValue, alignment: alignment)
    }

    func frame(maxWidth: Grid? = nil, maxHeight: Grid, alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: maxWidth?.rawValue, maxHeight: maxHeight.rawValue, alignment: alignment)
    }

    func lineSpacing(_ lineSpacing: Grid) -> some View {
        self.lineSpacing(lineSpacing.rawValue)
    }

    func offset(x: Grid = .zero, y: Grid = .zero) -> some View {
        self.offset(x: x.rawValue, y: y.rawValue)
    }

    func padding(_ edges: Edge.Set, _ length: Grid) -> some View {
        self.padding(edges, length.rawValue)
    }

    func padding(_ edges: Edge.Set) -> some View {
        self.padding(edges, .small)
    }

    func padding( _ length: Grid) -> some View {
        self.padding(.all, length)
    }

    func padding() -> some View {
        self.padding(.all, .small)
    }

    func shadow(
        color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33),
        radius: Grid,
        x: Grid = .zero,
        y: Grid = .zero
    ) -> some View {
        self.shadow(color: color, radius: radius.rawValue, x: x.rawValue, y: y.rawValue)
    }
}

public extension RoundedRectangle {
    init(cornerRadius: Grid, style: RoundedCornerStyle = .circular) {
        self.init(cornerRadius: cornerRadius.rawValue, style: style)
    }
}

public extension HStack {
    init?(alignment: VerticalAlignment = .center, spacing: Grid, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}

public extension VStack {
    init?(alignment: HorizontalAlignment = .center, spacing: Grid, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}

public extension LazyVGrid {
    init?(columns: [GridItem], spacing: Grid, @ViewBuilder content: () -> Content) {
        self.init(columns: columns, spacing: spacing.rawValue, content: content)
    }
}

public extension Spacer {
    init?(minLength: Grid) {
        self.init(minLength: minLength.rawValue)
    }
}

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
