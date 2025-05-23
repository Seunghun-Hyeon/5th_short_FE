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
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "star.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                Text("스플래시 화면")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}
