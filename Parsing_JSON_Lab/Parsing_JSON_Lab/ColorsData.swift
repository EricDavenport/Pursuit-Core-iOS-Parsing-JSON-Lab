//
//  ColorsData.swift
//  Parsing_JSON_Lab
//
//  Created by Eric Davenport on 11/26/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import Foundation

struct Colors256: Codable {
    
    let crayonBox = [CrayonBox]()
    
}

struct CrayonBox: Codable {
    let colorId: Int
    let hexString: String
    let name: String
    let rgb: [RGB]
}
struct RGB: Codable {
    let r: Int
    let g: Int
    let b: Int
}

extension Colors256 {
    static func getColors() -> [CrayonBox] {
        var crayons = [CrayonBox]()
        
        guard let fileURL = Bundle.main.url(forResource: "Colors", withExtension: "json") else {
            fatalError("unable to locare json file")
        }
        do {
            let data = try Data(contentsOf: fileURL)
            
            let crayonData = try JSONDecoder().decode(Colors256.self, from: data)
            crayons = crayonData.crayonBox
        } catch {
            fatalError("failed to load contents \(error)")
        }
        return crayons
    }
}
