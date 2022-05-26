//
//  Sample.swift
//  TestForPryaniky
//
//  Created by Руслан Штыбаев on 26.05.2022.
//

import Foundation

// MARK: - Sample
struct Sample {
    let data: [Datum]
    let view: [String]
}

// MARK: - Datum
struct Datum {
    let name: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
}

// MARK: - Variant
struct Variant {
    let id: Int
    let text: String
}
