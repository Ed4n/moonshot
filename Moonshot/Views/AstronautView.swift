//
//  AstronautView.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 30/12/24.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
                
            }
            .background(.darkBackground)
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline)
          
        }
        .background(.darkBackground)
    }
}

#Preview {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    return AstronautView(astronaut: astronauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
