//
//  ContentView.swift
//  Moonshot
//
//  Created by Marat Fakhrizhanov on 28.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGridView = false
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if isGridView {
                    
                    LazyVGrid(columns: columns) {
                        ForEach(mission) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:100, height: 100)
                                        .padding()
                                    
                                    VStack{
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
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
                    }
                    .padding([.horizontal, .bottom])
                    
                } else {
                    
                    ForEach(mission) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        }
                        label: {
                        HStack( spacing: 20) {
                            Image(mission.image)
                                .resizable()
                                .frame(width:120, height: 120)
                            
                            Spacer()
                            
                            Text(mission.displayName)
                                .padding()
                        }
                        .padding()
                        
                    }
                }
                      //
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark) // меняет цвет схемы// второй экран меняется тоже на который переходим
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { isGridView.toggle() }) {
                        Text(isGridView ? "List" : "Grid")
                            .padding()
                    }
                    
                }
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
