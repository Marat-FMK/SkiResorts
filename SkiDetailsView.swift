//
//  SkiDetailsView.swift
//  SkiResorts
//
//  Created by Marat Fakhrizhanov on 15.01.2025.
//

import Foundation
import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort

    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m")
                    .font(.title3)
            }

            VStack {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)cm")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity) // .infinity на самом деле не влияет на саму группу, потому что не оказывает воздействия на макет. Однако оно передается дочерним представлениям, а значит, они будут автоматически растягиваться по горизонтали. 
    }
}

#Preview {
    SkiDetailsView(resort: .example)
}


