//
//  MissionView.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 28/12/24.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){  width, axis in
                        width * 0.5
                    }
                    .padding(.bottom)
                
                VStack(alignment: .leading){
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink{
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70, height: 70)
                                    .clipShape(.circle)
                                    .overlay(
                                        Circle()
                                            .strokeBorder(.white, lineWidth: 1)
                                     )
                                
                                VStack(alignment: .leading){
                                    Text(crewMember.astronaut.name)
                                        .foregroundStyle(.white)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundStyle(.white)
                                        
                                }
                            }
                            .padding()
                        }
                    }
                }
                
            }
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }

    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
            return CrewMember(role: member.role, astronaut: astronaut)
        }else {
            fatalError("Missing Astronaut \(member.name)")
        }
        }
    }
}

#Preview {
    
    let mission: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: mission[0], astronauts: astronauts)
        
}
