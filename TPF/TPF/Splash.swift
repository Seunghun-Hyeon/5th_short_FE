//
//  Splash.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            Color(red: 114/255, green: 140/255, blue: 255/255)
                    .ignoresSafeArea()
            
            VStack {
                Image("splashicon")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
//                Text("미루니")
//                    .font(.title)
//                    .foregroundColor(.white)
            }
        }
    }
}
