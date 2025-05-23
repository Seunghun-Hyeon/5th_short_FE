//
//  ContentView.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showMainView = false
    
    var body: some View {
        ZStack {
            if showMainView {
                MainView()
            } else {
                Splash()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}

