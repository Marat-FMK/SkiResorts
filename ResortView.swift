//
//  ResortView.swift
//  SkiResorts
//
//  Created by Marat Fakhrizhanov on 15.01.2025.
//

import Foundation
import SwiftUI

struct ResortView: View {
    let resort: Resort

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()

                HStack {
                    ResortDetailsView(resort: resort)
                    SkiDetailsView(resort: resort)
                }
                .padding(.vertical)
                .background(.primary.opacity(0.1))
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)

                    Text("Facilities")
                        .font(.headline)

                    Text(resort.facilities, format: .list(type: .and))
                        .padding(.vertical) // можете использовать .or для получения «A, B или C», если вам это нужно.
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ResortView(resort: .example)
}

