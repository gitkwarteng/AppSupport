// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct Available<Content> {
    public let content: Content
    
    public init(_ content: Content) {
        self.content = content
    }
}


public extension View {
    var apply: Available<Self> { Available(self) }
}
