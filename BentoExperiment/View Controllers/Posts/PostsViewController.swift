//
//  PostsViewController.swift
//  BentoExperiment
//
//  Created by João Pereira on 10/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import UIKit
import Bento

final class PostsViewController: UIViewController {
    let viewModel = ViewModel()
    let tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.estimatedSectionFooterHeight = 18
        $0.estimatedSectionHeaderHeight = 18
        $0.sectionHeaderHeight = UITableViewAutomaticDimension
        $0.sectionFooterHeight = UITableViewAutomaticDimension
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.parent = self
        viewModel.render()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    
        viewModel.bind(tableView)
    }
    
    func open(_ post: Post) {
        let expandedVC = ExpandedPostViewController()
        self.navigationController?.pushViewController(expandedVC, animated: true)
    }
}

