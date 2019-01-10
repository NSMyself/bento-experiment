//
//  EmptySpaceCell.swift
//  BentoExperiment
//
//  Created by João Pereira on 10/01/2019.
//  Copyright © 2019 NSMyself. All rights reserved.
//

import UIKit
import Bento

final class EmptySpaceCell: UIView {}

final class EmptySpaceComponent: Renderable {
    typealias View = EmptySpaceCell
    
    struct Spec {
        let height: CGFloat
        let color: UIColor
    }
    
    private let spec: Spec
    
    init(spec: Spec) {
        self.spec = spec
    }
    
    func render(in view: View) {
        view.heightAnchor.constraint(equalToConstant: spec.height).isActive = true
        view.backgroundColor = spec.color
    }
}
