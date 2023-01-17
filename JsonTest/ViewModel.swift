//
//  ViewModel.swift
//  JsonTest
//
//  Created by Consultant on 1/16/23.
//

import Foundation
class ViewModel: ObservableObject {
    @Published var cities = [Model]()
 
    
     func decode() async throws -> [Model] {
        let weburl = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
        
        if let url = URL(string: weburl) {
            let (data, _) = try await URLSession.shared.data(from: url)
            cities  = try JSONDecoder().decode([Model].self, from: data)
            return cities
        } else {
            throw URLError(.badURL)
        }
    }

}
