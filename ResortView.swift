//
//  ResortView.swift
//  SkiResorts
//
//  Created by Marat Fakhrizhanov on 15.01.2025.
//

import Foundation
import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize // работа со шрифтами пр19 11/12
    @Environment(Favorites.self) var favorites // Добавили св-во так как в окружении на экране КонтентВью оно раздается всем обьктам которые используются в контент вью  пр 19 12/12 
    
    @State private var selectedFacility: Facility?
    @State private var showingFacility = false
    
    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()

                HStack {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large { // проверяем шрифт, если стандартный - то пропускаем в условие иначе берем другие представления (else)
                        VStack(spacing: 10) { ResortDetailsView(resort: resort) }
                        VStack(spacing: 10) { SkiDetailsView(resort: resort) }
                    } else {
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)

                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            Button {
                                selectedFacility = facility // передаем название кнопке
                                showingFacility = true // только потом вызываем алерт
                            } label: {
                                facility.icon // бурем из структуры иконку(представление)
                                    .font(.title)
                            }
                        }
                    }
                    .padding(.vertical) //Используем картинки вместо строк
                    
                    
//                    Text(resort.facilities, format: .list(type: .and))
//                        .padding(.vertical) // можете использовать .or для получения «A, B или C», если вам это нужно. 
                }
                .padding(.horizontal)
                
                Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") { // кнопка добавления в избранное
                    if favorites.contains(resort) {
                        favorites.remove(resort)
                    } else {
                        favorites.add(resort)
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More information", isPresented: $showingFacility, presenting: selectedFacility) { _ in // подставляем что бы использовать в дальнейшем facality в  message  пр19 11/12
        } message: { facility in
            Text(facility.description)
        }
//        .dynamicTypeSize(...DynamicTypeSize.xxxLarge) // ограничивает размер шрифта в представлении (меньше можно / больше нельзя)
    }
}

#Preview {
    ResortView(resort: .example)
        .environment(Favorites()) // внедряем пример избранного что бы работал превью пр 19 12/12
}

