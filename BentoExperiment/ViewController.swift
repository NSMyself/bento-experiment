//
//  ViewController.swift
//  BentoExperiment
//
//  Created by João Pereira on 10/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import UIKit
import Bento

class ViewController: UIViewController {

    let viewModel = ViewModel()
    let tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.estimatedSectionFooterHeight = 18
        $0.estimatedSectionHeaderHeight = 18
        $0.sectionHeaderHeight = UITableViewAutomaticDimension
        $0.sectionFooterHeight = UITableViewAutomaticDimension
        return $0
    }(UITableView())
    
    enum SectionId: Hashable {
        case first
        case second
        case third
        case fourth
    }
    
    enum RowId: Hashable {
        case space
        case note
        case toggle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("fdx?")
        setup()
        viewModel.render()
    }
    
    private func setup() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        viewModel.renderer.bind(tableView)
    }
}

