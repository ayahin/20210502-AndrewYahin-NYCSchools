//
//  Statuses.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 5/2/21.
//

import SwiftUI

enum StatusStyle {
    case success
    case failed
    case warning
    case info
    
    var color: Color { get {
        switch self {
        case .success: return .green
        case .failed: return .red
        case .warning: return .orange
        case .info: return .blue
        }
    }}
}

protocol Status {
    func description(name: String) -> String
    var systemImage: String { get }
    var style: StatusStyle { get }
}


enum LoadStatus : Status {
    case available
    case loading
    case empty
    case failed
    
    func description(name: String) -> String {
        switch self {
        case .available: return "\(name) loaded"
        case .loading: return "\(name) are loading..."
        case .empty: return "No \(name) available..."
        case .failed: return "\(name) failed to load..."
        }
    }
    
    var systemImage: String { get {
        switch self {
        case .available: return "checkmark.square"
        case .loading: return "arrow.3.trianglepath"
        case .empty: return "exclamationmark.triangle"
        case .failed: return "xmark.octagon"
        }
    }}
    
    var style: StatusStyle { get {
        switch self {
        case .available: return .success
        case .loading: return .info
        case .empty: return .warning
        case .failed: return .failed
        }
    }}
}

