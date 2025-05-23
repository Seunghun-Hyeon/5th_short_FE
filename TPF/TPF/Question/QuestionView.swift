//
//  QuestionView.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//
import SwiftUI

struct QuestionView: View {
    let index: Int
    let total: Int
    let questionText: String
    let subject: String
    let tasks: [String]
    @Binding var answers: [String]
    @Binding var path: NavigationPath
    @State private var input: String = ""
    @State private var goNext = false
    @FocusState private var isTextEditorFocused: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // 상단 질문 번호
            Text("\(index + 1)/\(total)")
                .font(.caption)
                .foregroundColor(.gray)

            // 질문 텍스트
            Text(questionText)
                .font(.title2)
                .fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: true)

            // 답변 입력 칸 (TextEditor)
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(UIColor.systemGray5))
                    .frame(height: 150)

                TextEditor(text: $input)
                    .padding(8)
                    .background(Color.clear)
                    .focused($isTextEditorFocused)  // 🔹 TextEditor에 포커스 적용
                    .cornerRadius(12)
                    .frame(height: 150)
            }

            // 글자 수 표시
            HStack {
                Spacer()
                Text("\(input.count)/100")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            // 예시 버튼
            Button(action: {
                input = exampleAnswer(for: questionText)
            }) {
                Text("답변 예시")
                    .font(.subheadline)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(8)
            }
            .padding(.top, 10)

            Spacer()

            // 다음으로 이동 버튼
            Button(action: {
                answers[index] = input
                goNext = true
            }) {
                Text("다음으로")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    .foregroundColor(.black)
            }

            // 다음 뷰로 Navigation
            NavigationLink(destination: nextDestination(), isActive: $goNext) {
                EmptyView()
            }
        }
        .padding()
        .navigationTitle("질문 페이지")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("완료") {
                    isTextEditorFocused = false
                }
            }
        }
    }

    @ViewBuilder
    func nextDestination() -> some View {
        if index + 1 < total {
            QuestionView(
                index: index + 1,
                total: total,
                questionText: questionList[index + 1].text,
                subject: subject,
                tasks: tasks,
                answers: $answers,
                path: $path
            )
        } else {
            SummaryView(
                subject: subject,
                tasks: tasks,
                answers: answers,
                path: $path
            )
        }
    }

    func exampleAnswer(for question: String) -> String {
        switch question {
        case "무슨 과제를 미루고 있었나요?":
            return "자료구조"
        case "어떤 상활일 때 과제를 미루게 되나요?":
            return "피곤할 때, 귀찮을 때"
        case "과제를 미루고, 대신 어떤 활동을 하나요?":
            return "유튜브 보기, 눕기, 놀기"
        case "과제를 실제로 시작하는 건 보통 언제쯤 인가요?":
            return "마감당일"
        case "과제를 시작하려고 할 때, 머릿속에 어떤 생각이드나요?":
            return "너무 귀찮고 귀찮고 그냥 귀찮아요"
        default:
            return "시간이 없어서 자꾸 미루게 돼요"
        }
    }

    let questionList: [Question] = [
        Question(text: "무슨 과제를 미루고 있었나요?"),
        Question(text: "어떤 상활일 때 과제를 미루게 되나요?"),
        Question(text: "과제를 미루고, 대신 어떤 활동을 하나요?"),
        Question(text: "과제를 실제로 시작하는 건 보통 언제쯤 인가요?"),
        Question(text: "과제를 시작하려고 할 때, 머릿속에 어떤 생각이드나요?")
    ]

    struct Question {
        let text: String
    }
}
