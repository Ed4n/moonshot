//
//  MissionListView.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 7/1/25.
//

import SwiftUI

struct MissionListView: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List(missions) { mission in
            NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formatedLaunchDate)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .listRowBackground(Color.lightBackground) // Apply custom row background here
        }
        .scrollContentBackground(.hidden) // Hide default list background
        .background(Color.darkBackground) // Set custom background for the whole view
        .applyDarkBackgroundList() //This an extension created for reusability.
    }
}


