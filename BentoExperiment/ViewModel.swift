//
//  ViewModel.swift
//  BentoExperiment
//
//  Created by João Pereira on 10/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import UIKit
import Bento

final class ViewModel {
    let renderer = Renderer()
    let store = Store()
    
    func render() {
        renderer.fire(posts: store.posts)
    }
}

extension ViewModel {
    final class Renderer {
        
        // this is a quite naive way of setting up things but the purpose of this experiment is to toy around with Bento, so i won't waste time with that
        // you can find a more adequate implementation of this example in Bento's own example apps (eg: BookAppointmentViewModel)
        private var tableView: UITableView?
        
        func bind(_ tableView: UITableView) {
            self.tableView = tableView
        }
        
        func fire(posts: [Post]) {
            let box = Box.empty
                |-+ Section(id: SectionId.noId)
                |---* makeRows(from: posts)
            
            tableView?.render(box)
        }
        
        private func makeRows(from posts: [Post]) -> [Node<RowId>] {
            return posts.enumerated().map { (index, post) in
                return RowId.post(post) <> PostComponent(title: post.title, description: post.body)
            }
        }
    }
}
