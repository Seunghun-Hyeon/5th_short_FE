//
//  TotalView.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//

import SwiftUI

struct TotalView: View {
    @State private var latestTodo: Todo?

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("1번")
                .font(.headline)
                .padding(.leading)

            if let todo = latestTodo {
                HStack {
                    Image("icon")
                        .resizable()
                        .frame(width: 36, height: 36)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(todo.subject)
                            .font(.headline)
                            .foregroundColor(.black)

                        Text("귀찮음") // ✳️ 감정 라벨은 예시 (나중에 계산 가능)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(hex: "7398FB"))
                            .cornerRadius(8)
                    }

                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "7398FB"), lineWidth: 2)
                )
                .padding(.horizontal)
            } else {
                Text("저장된 데이터가 없습니다.")
                    .foregroundColor(.gray)
                    .padding()
            }

            Spacer()
        }
        .onAppear {
            latestTodo = TodoManager.loadTodos().last
        }
    }
}
