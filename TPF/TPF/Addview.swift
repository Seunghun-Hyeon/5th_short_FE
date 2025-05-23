//
//  Addview.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//


import SwiftUI

struct AddView: View {
    let questionList: [Question]
    @State private var subjectName: String = ""
    @State private var tasks: [String] = [""]
    @State private var answers = Array(repeating: "", count: 5)
    @State private var navigateToQuestion = false
    @Binding var path: NavigationPath

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Form {
                    Section(header: Text("과목명")) {
                        TextField("예: 자료구조", text: $subjectName)
                    }

                    Section(header: Text("세부 할 일")) {
                        ForEach(tasks.indices, id: \.self) { index in
                            TextField("할 일 \(index + 1)", text: $tasks[index])
                        }

                        Button("할 일 추가") {
                            tasks.append("")
                        }
                    }
                }

                Spacer()

                // NavigationLink를 트리거로 사용
                NavigationLink(
                    destination: QuestionView(
                        index: 0,
                        total: 5,
                        questionText: "과제를 미루는 이유는 무엇인가요?",
                        subject: subjectName,
                        tasks: tasks,
                        questionList: questionList,
                        answers: $answers,
                        path: $path
                    ),
                    isActive: $navigateToQuestion
                ) {
                    EmptyView()
                }

                Button("다음으로") {
                    navigateToQuestion = true
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(12)
                .padding(.horizontal)
            }
            .navigationTitle("과제 정보 입력")
        }
    }
}

