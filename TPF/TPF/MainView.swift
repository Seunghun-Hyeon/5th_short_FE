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

    let questionList: [Question] = [
        Question(text: "과제를 미루는 이유는 무엇인가요?"),
        Question(text: "가장 어려웠던 점은 무엇인가요?"),
        Question(text: "과제를 끝내고 나면 어떤 기분인가요?"),
        Question(text: "과제를 하기 위해 필요한 것은 무엇인가요?"),
        Question(text: "지금 바로 시작한다면 어떤 것부터 할 수 있을까요?")
    ]
    
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
                Button {
                    path.append(0) // 첫 번째 질문으로 이동
                } label: {
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
            .navigationDestination(for: Int.self) { index in
                QuestionView(
                    index: index,
                    total: questionList.count,
                    questionText: questionList[index].text,
                    subject: subject,
                    tasks: tasks,
                    questionList: questionList,
                    answers: $answers,
                    path: $path
                )
            }
            .navigationDestination(for: String.self) { value in
                if value == "summary" {
                    SummaryView(
                        subject: subject,
                        tasks: tasks,
                        answers: answers,
                        path: $path
                    )
                }
            }
        }
    }
}

#Preview {
    MainView()
}
