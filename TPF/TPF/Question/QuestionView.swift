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
    let questionList: [Question]
    @Binding var answers: [String]
    @Binding var path: NavigationPath
    @State private var input: String = ""
    @State private var goNext = false

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
                if index + 1 < total {
                    path.append(index + 1)
                } else {
                    path.append("summary")
                }
            }) {
                Text("다음으로")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .navigationTitle("질문 페이지")
        .navigationBarTitleDisplayMode(.inline)
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
                questionList: questionList,
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
        case "과제를 미루는 이유는 무엇인가요?":
            return "딱 시작하기가 너무 막막하고 귀찮아요. 시작이 어려워요."
        case "가장 어려웠던 점은 무엇인가요?":
            return "개념은 이해했는데 응용하는 문제는 도저히 손이 안 가요."
        case "과제를 끝내고 나면 어떤 기분인가요?":
            return "끝내고 나면 진짜 해방된 느낌이라 뿌듯해요."
        case "과제를 하기 위해 필요한 것은 무엇인가요?":
            return "핸드폰을 멀리하고 집중할 수 있는 조용한 공간이 필요해요."
        case "지금 바로 시작한다면 어떤 것부터 할 수 있을까요?":
            return "우선 강의 다시 보면서 과제 조건 정리부터 해볼 수 있을 것 같아요."
        default:
            return "시간이 없어서 자꾸 미루게 돼요"
        }
    }

}
