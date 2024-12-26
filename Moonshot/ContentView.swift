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
    
    var body: some View {
        VStack{
            Text("Astronauts: \(astronauts.count)")
            Text("Missions: \(missions.count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
