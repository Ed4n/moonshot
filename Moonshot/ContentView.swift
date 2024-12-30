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
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions){ mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        }label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formatedLaunchDate)
                                        .foregroundStyle(.white.opacity(0.7))
                                    
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay (
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                        .padding(.bottom)
                    }
                    
                }
                .padding([.horizontal, .bottom])
                .padding(.top, 10)
                
            }
            .navigationTitle("Missions")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}


