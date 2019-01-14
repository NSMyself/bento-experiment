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
    weak var parent: PostsViewController?
    private let renderer = Renderer()
    private let store = Store()
    
    func render() {
        renderer.fire(posts: store.posts) { [weak self] (id: Int) in
            guard let post = self?.store.posts.first(where: { $0.id == id }) else { fatalError("Invalid post ID") }
            self?.parent?.open(post) // again, naive
        }
    }
    
    func bind(_ tableView: UITableView) {
        renderer.bind(tableView)
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
        
        func fire(posts: [Post], didTap: ((Int)->Void)? = nil) {
            let box = Box.empty
                |-+ Section(id: SectionId.noId)
                |---* makeRows(from: posts, didTap: didTap)
            
            tableView?.render(box)
        }
        
        private func makeRows(from posts: [Post], didTap closure: ((Int)->Void)? = nil) -> [Node<RowId>] {
            return posts.enumerated().map { (arg) -> Node<RowId> in
                let (_, post) = arg
                return RowId.post(post) <> PostComponent(id: post.id,
                                                         title: post.title,
                                                         description: post.body,
                                                         didTap: closure
                                            )
            }
        }
    }
}
