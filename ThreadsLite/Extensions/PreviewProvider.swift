//
//  PreviewProvider.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 04/12/25.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = User(id: UUID().uuidString, fullName: "max vertisent", email: "max@gmail.com", username: "maxsuperpen01", profileImafeUrl: nil, bio: nil)
        
}
