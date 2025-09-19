//
//  iOS18Support.swift
//  AppSupport
//
//  Created by Kwarteng on 12/09/2025.
//

import SwiftUI
import ImagePlayground


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
    
    @ViewBuilder func zoom(
        sourceID: some Hashable,
        in namespace: Namespace.ID
    ) -> some View {
        if #available(iOS 18.0, macOS 12, *) {
            content
            #if os(iOS)
                .navigationTransition(.zoom(sourceID: sourceID, in: namespace))
            #endif
                .interactiveDismissDisabled()
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
}

