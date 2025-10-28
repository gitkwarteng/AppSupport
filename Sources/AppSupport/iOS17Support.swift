//
//  iOS17Support.swift
//  AppSupport
//
//  Created by Kwarteng on 12/09/2025.
//

import SwiftUI



/// Available for ContentTransition (iOS 17)
public enum AvailableContentInteraction {
    case automatic
    case resizes
    case scrolls
}


@available(iOS 16.4, *)
extension AvailableContentInteraction {
    var interaction: PresentationContentInteraction {
        switch self {
        case .automatic:
            return .automatic
        case .resizes:
            return .resizes
        case .scrolls:
            return .scrolls
        }
    }
}


// MARK: iOS 17 Extensions

/// Available for ContentTransition (iOS 17)
public enum AvailableContentTransition {
    case identity
    case opacity
    case numericText
}


/// Available for ContentTransition (iOS 17)
public enum AvailableSearchPresentationToolbarBehavior {
    case automatic
    case avoidHidingContent
}


@available(iOS 17.1, *)
extension AvailableSearchPresentationToolbarBehavior {
    var behavior: SearchPresentationToolbarBehavior {
        switch self {
        case .automatic:
            return .automatic
        case .avoidHidingContent:
            return .avoidHidingContent
        }
    }
}

@MainActor
@available(iOS 14, macOS 13, *)
public extension Available where Content: View {
    @ViewBuilder
    func contentTransition(_ transition: AvailableContentTransition) -> some View {
        if #available(iOS 17.0, *) {
            switch transition {
            case .identity:
                content.contentTransition(.identity)
            case .opacity:
                content.contentTransition(.opacity)
            case .numericText:
                content.contentTransition(.numericText())
            }
        } else {
            content
        }
    }
}


@MainActor
@available(iOS 14, macOS 13.3, *)
public extension Available where Content: View {
    
    @ViewBuilder
    func presentationCornerRadius(_ cornerRadius: CGFloat?) -> some View {
        if #available(iOS 17.0, *) {
            content.presentationCornerRadius(cornerRadius)
        } else {
            content
        }
    }
    
    @ViewBuilder
    func presentationContentInteraction(_ behavior: AvailableContentInteraction) -> some View {
        if #available(iOS 17.0, *) {
            content.presentationContentInteraction(behavior.interaction)
        } else {
            content
        }
    }
}


@MainActor
@available(iOS 14, macOS 13, *)
public extension Available where Content: View {
    @ViewBuilder
    func searchPresentationToolbarBehavior(_ behavior: AvailableSearchPresentationToolbarBehavior) -> some View {
        if #available(iOS 17.1, *) {
            content.searchPresentationToolbarBehavior(behavior.behavior)
        } else {
            content
        }
    }
}
