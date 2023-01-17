//
//  Model.swift
//  JsonTest
//
//  Created by Consultant on 1/16/23.
//

import Foundation
struct Model: Decodable, Identifiable {
    
    let capital: String
    let code: String
    let name: String
    var id: String { return code }
}

