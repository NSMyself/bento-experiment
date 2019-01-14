//
//  Collection+Safe.swift
//  BentoExperiment
//
//  Created by João Pereira on 14/01/2019.
//  Copyright © 2019 NSextension Collection {

import Foundation

extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}



