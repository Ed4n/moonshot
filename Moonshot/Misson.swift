//
//  Misson.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 26/12/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    //This is a nested struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
