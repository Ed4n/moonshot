//
//  MIssionsListView.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 6/1/25.
//

import SwiftUI

struct MissionsCardView: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        MissionCard(mission: mission)
                    }
                    .padding(.bottom)
                }
            }
            .padding([.horizontal, .bottom])
            .padding(.top, 10)
        }
       
    }
}
