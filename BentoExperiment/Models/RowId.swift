//
//  RowId.swift
//  BentoExperiment
//
//  Created by João Pereira on 11/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import Foundation

enum RowId {
    case loading
    case post(Post)
}

extension RowId: Hashable {
    static func == (lhs: RowId, rhs: RowId) -> Bool {
        switch(lhs, rhs) {
        case let (.post(lhsPost), .post(rhsPost)):
            return lhsPost == rhsPost
        case (.loading, .loading):
            return false
        default:
            return false
        }
    }
}
