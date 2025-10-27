//
//  Copyright © Kalisten 2024
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

import SwiftUICore

extension LocalizedStringKey {
    public static let empty = LocalizedStringKey(String.empty)
}
