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
                        .font(.system(size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGray5))
                .cornerRadius(20)
                .padding(.horizontal)

                Spacer()

                // ✅ QuestionView 호출 시 모든 인자 전달
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
