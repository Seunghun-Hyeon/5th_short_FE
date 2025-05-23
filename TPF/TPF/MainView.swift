//
//  MainView.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//

import SwiftUI

struct MainView: View {
    @State private var path = NavigationPath()
    @State private var subject = "자료구조"
    @State private var tasks = ["3주차 과제", "예제 문제 풀기"]
    @State private var answers = Array(repeating: "", count: 5)

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                HStack {
                    Image("miroonyee")
                    Spacer()
                        .frame(width: 300)
                }

                Spacer()

                VStack(spacing: 20) {
                    Rectangle()
                        .fill(Color(red: 246/255, green: 247/255, blue: 250/255))
                        .frame(width: 250, height: 250)
                        .overlay(
                            Image("icon")
                                .resizable()
                                .scaledToFit()
                        )

                    Text("왜 미루니?")
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                    Text("미루니랑 같이 천천히 과제를 시작해보아요")
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 246/255, green: 247/255, blue: 250/255)) // 카드 전체 배경
                .cornerRadius(20)
                .padding(.horizontal)

                Spacer()

                NavigationLink(
                    destination: QuestionView(
                        index: 0,
                        total: 5,
                        questionText: "과제를 미루는 이유는 무엇인가요?",
                        subject: subject,
                        tasks: tasks,
                        answers: $answers,
                        path: $path
                    )
                ) {
                    Text("과제 추가하기")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 115/255, green: 152/255, blue: 251/255))             .foregroundColor(.white)
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
