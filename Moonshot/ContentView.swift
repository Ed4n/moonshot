//
//  ContentView.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 19/12/24.
//

import SwiftUI

struct ContentView: View {
    //    Here we must add the type of data we want to display because SwiftUI doesn't know how to decode it automatically. We just tell swift that the decode extension from Bundle will recieve some array of codable data but not specifically what.

    //    Also we must add the data related to the bundle, in this case astronauts is an string array  of codable data and missions is an dictionary of codable data.
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var displayListView = false

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationStack {
            Group {
                if displayListView {
                    MissionListView(missions: missions, astronauts: astronauts)
                    
                }else {
                    MissionsCardView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Missions")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    displayListView.toggle()
                } label: {
                    Label("Toggle List View", systemImage: displayListView ? "list.bullet.rectangle.fill" : "list.bullet.rectangle")
                }.tint(.white) // this force all to be white and if it doesn't work, we can added to the toolbar.
            }
        }
    }
}

#Preview {
    ContentView()
}
