//
//  CustomLinearGradients.swift
//  Kalisten
//
//  Created by Pedro Solis Garcia on 12/05/20.
//  Copyright © 2020 VILHON Technologies. All rights reserved.
//

import SwiftUI
import Colors

internal extension LinearGradient {
    static let primaryVertical = LinearGradient(
        gradient: Gradient(
            colors: [
                Colors.Primary.mid,
                Colors.Primary.dark
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
}
