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
    var id: Int = -1
    var didTap: ((Int) -> Void)?
    
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
        setupTapGesture()
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
        
        isUserInteractionEnabled = true
    }
    
    private func setupTapGesture() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        addGestureRecognizer(recognizer)
    }
    
    @objc private func tapped(gestureRecognizer: UITapGestureRecognizer) {
        didTap?(id)
    }
}

final class PostComponent: Renderable {
    private let id: Int
    private let title: String
    private let description: String
    private let didTap: ((Int) -> Void)?
    
    typealias View = PostCell
    
    init(id: Int, title: String, description: String, didTap: ((Int) -> Void)? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.didTap = didTap
    }
    
    func render(in view: PostCell) {
        view.id = id
        view.titleLabel.text = title
        view.descriptionLabel.text = description
        view.didTap = didTap
    }
}
