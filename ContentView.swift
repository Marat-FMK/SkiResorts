//
//  ContentView.swift
//  SkiResorts
//
//  Created by Marat Fakhrizhanov on 15.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json") // путь к JSON Bundle
    
    @State private var searchText = ""
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
           resorts
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort) // открываем экран детальный для каждого ресорта
            }
            .searchable(text: $searchText, prompt: " Search for a resort") // prompt - placeholder
        } detail: { //  SplitView / То что отображатеся пок не выбрана ниодна ссылка (при первом включении грубо говоря ;) )
            WelcomeView()
        }
        
    }
}

#Preview {
    ContentView()
}
