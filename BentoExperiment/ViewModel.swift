//
//  ViewModel.swift
//  BentoExperiment
//
//  Created by João Pereira on 10/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import UIKit

struct RequestCodable: Codable {
    let posts: [Post]
}

final class ViewModel {
    
    final class Renderer {
        
        // this is a quite naive way of setting up things but the purpose of this experiment is to toy around with Bento, so i won't waste time with that
        // you can find a more adequate implementation of this example in Bento's own example apps (eg: BookAppointmentViewModel)
        private var tableView: UITableView?
        
        func bind(_ tableView: UITableView) {
            self.tableView = tableView
        }
        
        func fire(posts: [Post]) {
            print(posts)
        }
    }
        
    let renderer = Renderer()
    let store = Store()
    
    func render() {
        print("oi?")
        renderer.fire(posts: store.posts)
    }
}
