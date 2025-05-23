//
//  MainView.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack() {
                HStack {
                    Image("miroonyee")
                    
                    Spacer()
                        .frame(width: 300)
                }
                Spacer()
                VStack(spacing: 20) {
                    Rectangle()
                        .fill(Color(UIColor.systemGray5))
                        .frame(width: 250, height: 250)
                        .overlay(
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray)
                        )

                    Text("오늘은 어떤 과제를 시작할까요?\n미루니가 도와줄게요 :)")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(20)
                .padding(.horizontal)

                Spacer()

                // 하단 과제 추가 버튼
                NavigationLink(destination: AddView()) {
                    Text("과제 추가하기")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MainView()
}

