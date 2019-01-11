//
//  PostCell.swift
//  BentoExperiment
//
//  Created by João Pereira on 11/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import UIKit
import Bento

final class PostCell: UIView {
    
    private let labelPadding: CGFloat = 8
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 17)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    let descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .gray
        return $0
    }(UILabel())
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }

    private func setupLabels() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: labelPadding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: labelPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -labelPadding),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: labelPadding),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -labelPadding)
        ])
    }
}

final class PostComponent: Renderable {
    
    private let title: String
    private let description: String
    
    typealias View = PostCell
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    func render(in view: PostCell) {
        view.titleLabel.text = title
        view.descriptionLabel.text = description
    }
}
