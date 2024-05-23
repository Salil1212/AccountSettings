//
//  AccountSettingsRouter.swift
//  Model
//
//  Created by Nickelfox on 22/05/24.
//  Copyright © 2024 Nickelfox. All rights reserved.
//

import Foundation
import FoxAPIKit

public enum DealerHistoryRouter: BaseRouter {
    case fetchAccountSettings(id: String)
    public var method: HTTPMethod {
        switch self {
        case .fetchAccountSettings:
            return .get
        }
    }
    public var path: String {
        switch self {
        case .fetchAccountSettings(let id):
            return "/user/dealer/detail/\(id)"
        }
    }
    public var params: [String: Any] {
        switch self {
        default: return [:]
        }
    }
    public var keypathToMap: String? {
        switch self {
        case .fetchAccountSettings:
            return "data.outlets"
        default:
            return "data"
        }
    }
}


