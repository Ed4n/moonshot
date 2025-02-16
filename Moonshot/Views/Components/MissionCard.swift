//
//  MissionCard.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 3/1/25.
//

import SwiftUI

struct MissionCard: View {
    
    let mission: Mission
    
    var body: some View {
        VStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()

            VStack {
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
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

#Preview {
    let mission: [Mission] = Bundle.main.decode("missions.json")
    return MissionCard(mission: mission[0])
}
