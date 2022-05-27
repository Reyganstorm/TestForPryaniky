//
//  BoxForSegmentedControl.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 27.05.2022.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
