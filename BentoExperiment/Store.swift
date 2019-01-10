//
//  Decodable+loadJSON.swift
//  BentoExperiment
//
//  Created by João Pereira on 10/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import Foundation

class Store {
    
    let posts: [Post]
    
    init() {
        
        let url = Bundle.main.url(forResource: "posts", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            self.posts = try JSONDecoder().decode([Post].self, from: data)
        } catch {
            print(error.localizedDescription)
            self.posts = []
        }
    }
}
