//
//  iOS18Support.swift
//  AppSupport
//
//  Created by Kwarteng on 12/09/2025.
//

import SwiftUI
import ImagePlayground


public enum NavigationTransitionStyle {
    case zoom(sourceID: Hashable, in: Namespace.ID)
    case automatic
    
}

@available(iOS 18, *)
public extension NavigationTransitionStyle {
    
    var asTransition: NavigationTransition {
        switch self {
        case .zoom(let sourceID, let namespace):
            return .zoom(sourceID: sourceID, in: namespace)
        case .automatic:
            return .automatic
        }
    }
    
}



public enum AvailableTabViewStyle {
    case tabBarOnly
    case sidebarAdaptable
    case automatic
    
}

@available(iOS 18, *)
public extension AvailableTabViewStyle {
    
    var asTabViewStyle: TabViewStyle {
        switch self {
        case .tabBarOnly:
            return .tabBarOnly
        case .sidebarAdaptable:
            return .sidebarAdaptable
        case .automatic:
            return .automatic
        }
    }
    
}


@MainActor
@available(iOS 14, macOS 11, *)
public extension Available where Content: View {
    
    @ViewBuilder func presentationSizeForm() -> some View {
        if #available(iOS 18, macOS 15, *) {
            content.presentationSizing(.form)
        } else {
            content
        }
    }
    
    @ViewBuilder func navigationTransition(
        sourceId: some Hashable,
        in namespace: Namespace.ID
    ) -> some View {
        if #available(iOS 18.0, macOS 12, *) {
            content
                .navigationTransition(.zoom(sourceID: sourceId, in: namespace))
        } else {
            content
        }
    }
    
    @ViewBuilder func sheetNavigationTransition(
        sourceId: some Hashable,
        in namespace: Namespace.ID
    ) -> some View {
        if #available(iOS 26.0, *) {
            content
                .navigationTransition(.zoom(sourceID: sourceId, in: namespace))
        } else {
            content
        }
    }
    
    @ViewBuilder func matchedTransitionSource(
        id: some Hashable,
        in namespace: Namespace.ID
    ) -> some View {
        if #available(iOS 18.0, macOS 15, *) {
            content.matchedTransitionSource(id: id, in: namespace)
        } else {
            content
        }
    }
    
    @ViewBuilder func imagePlayground(
        _ presented: Binding<Bool>,
        completion: @escaping (URL?) -> Void
    ) -> some View {
        if #available(iOS 18.1, macOS 15.1, *) {
            if ImagePlaygroundViewController.isAvailable {
                content
                    .imagePlaygroundSheet(isPresented: presented) { url in
                        completion(url)
                    }
            } else {
                content
            }
        } else {
            content
        }
    }
    @ViewBuilder func tabViewStyle(
        _ style: AvailableTabViewStyle
    ) -> some View {
        if #available(iOS 18.0, *) {
            content
                .tabViewStyle(style.asTabViewStyle)
        } else {
            content
        }
    }
}

