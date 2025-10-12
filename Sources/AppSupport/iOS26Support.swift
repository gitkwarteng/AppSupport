//
//  iOS26Support.swift
//  AppSupport
//
//  Created by Kwarteng on 12/09/2025.
//

import SwiftUI


@available(iOS 14, macOS 12, *)
public enum AvailableGlass: Equatable, Sendable {
    case regular
    case clear
    case identity
    case tinted(Color?)
    case interactive(isEnabled: Bool)
    case tintedAndInteractive(color: Color?, isEnabled: Bool)
    
    // Default convenience
    public static var regularInteractive: AvailableGlass {
        .tintedAndInteractive(color: nil, isEnabled: true)
    }
}

@available(iOS 26, macOS 26, *)
extension AvailableGlass {
    public var glass: Glass {
        switch self {
        case .regular:
            return .regular
        case .clear:
            return .clear
        case .identity:
            return .identity
        case .tinted(let color):
            return .regular.tint(color)
        case .interactive(let isEnabled):
            return .regular.interactive(isEnabled)
        case .tintedAndInteractive(let color, let isEnabled):
            return .regular.tint(color).interactive(isEnabled)
        }
    }
}

public enum AvailableGlassEffectTransition: Equatable, Sendable {
    case identity
    case materialize
}

@available(iOS 26, macOS 26, *)
public extension AvailableGlassEffectTransition {
    var transition: GlassEffectTransition {
        switch self {
        case .identity:
            return .identity
        case .materialize:
            return .materialize
        }
    }
}

public enum AvailableScrollEdgeEffectStyle: Hashable, Sendable {
    case automatic
    case hard
    case soft
}

@available(iOS 26.0, macOS 26, *)
public extension AvailableScrollEdgeEffectStyle {
    var style: ScrollEdgeEffectStyle {
        switch self {
        case .automatic: return .automatic
        case .hard: return .hard
        case .soft: return .soft
        }
    }
}

@available(iOS 26.0, macOS 26, *)
public extension AvailableSymbolColorRenderingMode {
    var renderingMode: SymbolColorRenderingMode {
        switch self {
        case .flat: return .flat
        case .gradient: return .gradient
        }
    }
}

public enum AvailableSymbolColorRenderingMode: Equatable, Sendable {
    case flat
    case gradient
}

public enum AvailableSymbolVariableValueMode: Equatable, Sendable {
    case color
    case draw
}

@available(iOS 26.0, macOS 26, *)
public extension AvailableSymbolVariableValueMode {
    var renderingMode: SymbolVariableValueMode {
        switch self {
        case .color: return .color
        case .draw: return .draw
        }
    }
}

public enum AvailableTabBarMinimizeBehavior: Hashable, Sendable {
    case automatic
    case onScrollDown
    case onScrollUp
    case never
}

@available(iOS 26.0, macOS 26, *)
public extension AvailableTabBarMinimizeBehavior {
    var behavior: TabBarMinimizeBehavior {
        switch self {
        case .automatic:
            return .automatic
#if os(iOS)
        case .onScrollDown:
            return .onScrollDown
        case .onScrollUp:
            return .onScrollUp
        case .never:
            return .never
#else
        default:
            return .automatic
#endif
        }
    }
}


@MainActor
@available(iOS 15.0, macOS 12, *)
public extension Available where Content: View {
    
    @ViewBuilder func presentationBackground(_ shape: some ShapeStyle = Material.thin) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content
        } else if #available(iOS 16.4, *) {
            content.presentationBackground(shape)
        } else {
            content
        }
    }
    
    @ViewBuilder func glassEffectTransition(_ transition: AvailableGlassEffectTransition) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.glassEffectTransition(transition.transition)
        } else {
            content
        }
    }
    
    @ViewBuilder func glassEffect(
        _ glass: AvailableGlass = .regular,
        in shape: some Shape = Capsule()
    ) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.glassEffect(glass.glass, in: shape)
        } else {
            content.clipShape(shape)
        }
    }
    
    @ViewBuilder func glassEffect(
        _ glass: AvailableGlass = .regular,
        in shape: some Shape = Capsule(),
        fallback: some ShapeStyle) -> some View {
            if #available(iOS 26.0, macOS 26, *) {
                content.glassEffect(glass.glass, in: shape)
            } else {
                content.background(fallback, in: shape)
            }
        }
    
    @ViewBuilder func glassEffectContainer(spacing: CGFloat? = nil) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            GlassEffectContainer(spacing: spacing) { content }
        } else {
            content
        }
    }
    
    @ViewBuilder func glassButtonStyle(fallbackStyle: some PrimitiveButtonStyle = DefaultButtonStyle()) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.buttonStyle(.glass)
        } else {
            content.buttonStyle(fallbackStyle)
        }
    }
    
    @ViewBuilder func glassProminentButtonStyle() -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.buttonStyle(.glassProminent)
        } else {
            content.buttonStyle(.borderedProminent)
        }
    }
    
    @ViewBuilder func backgroundExtensionEffect() -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.backgroundExtensionEffect()
        } else {
            content
        }
    }
    
    @ViewBuilder func scrollEdgeEffectStyle(
        _ style: AvailableScrollEdgeEffectStyle?,
        for edges: Edge.Set
    ) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.scrollEdgeEffectStyle(style?.style, for: edges)
        } else {
            content
        }
    }
    
    @ViewBuilder func scrollEdgeEffectHidden(
        _ hidden: Bool = true,
        for edges: Edge.Set = .all
    ) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.scrollEdgeEffectHidden(hidden, for: edges)
        } else {
            content
        }
    }
    
    @ViewBuilder func glassEffectID(
        _ id: (some Hashable & Sendable)?,
        in namespace: Namespace.ID
    ) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.glassEffectID(id, in: namespace)
        } else {
            content
        }
    }
    
    @ViewBuilder func symbolColorRenderingMode(_ mode: AvailableSymbolColorRenderingMode?) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.symbolColorRenderingMode(mode?.renderingMode)
        } else {
            content
        }
    }
    
    @ViewBuilder func symbolVariableValueMode(_ mode: AvailableSymbolVariableValueMode?) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.symbolVariableValueMode(mode?.renderingMode)
        } else {
            content
        }
    }
    
    @ViewBuilder func tabBarMinimizeBehavior(_ behavior: AvailableTabBarMinimizeBehavior) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            content.tabBarMinimizeBehavior(behavior.behavior)
        } else {
            content
        }
    }
    
    @ViewBuilder func listSectionMargins(_ edges: Edge.Set = .all, _ length: CGFloat?) -> some View {
        if #available(iOS 26.0, *) {
            #if os(iOS)
                content.listSectionMargins(edges, length)
            #else
                content
            #endif
        } else {
            content
        }
    }
    
    @ViewBuilder func safeAreaBar<V: View>(edge: VerticalEdge,
                                           alignment: HorizontalAlignment = .center,
                                           spacing: CGFloat? = nil,
                                           @ViewBuilder content: () -> V) -> some View {
        if #available(iOS 26.0, macOS 26, *) {
            self.content.safeAreaBar(edge: edge, alignment: alignment, spacing: spacing, content: content)
        } else {
            self.content.safeAreaInset(edge: edge, alignment: alignment, spacing: spacing, content: content)
        }
    }
}

