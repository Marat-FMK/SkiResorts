//
//  ResortDetailsView.swift
//  SkiResorts
//
//  Created by Marat Fakhrizhanov on 15.01.2025.
//

import SwiftUI

struct ResortDetailsView: View {
    
    let resort: Resort
    
    var size: String { // определяем размер представляя его в виде слова а не цифры
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
        
       // ["Small", "Average", "Large"][resort.size - 1]
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                Text(size)
                    .font(.title3)
            }

            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity) // как в предидушем представении
        
    }
    
}


    #Preview {
        ResortDetailsView(resort: .example)
    }

