//
//  Copyright © Kalisten 2024-2026
//

import Foundation

extension String {
    
    // MARK: - Static
    
    public static let empty = ""
    
    // MARK: - isNotEmpty
    
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}

import SwiftUI

extension LocalizedStringKey {
    public static let empty = LocalizedStringKey(String.empty)
}
