//
//  Post.swift
//  BentoExperiment
//
//  Created by João Pereira on 10/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
