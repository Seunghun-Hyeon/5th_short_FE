import SwiftUI
import Charts

struct WordFrequency: Identifiable {
    var id: String { word }
    let word: String
    let count: Int
}

func extractWordFrequencies(from answers: [String]) -> [WordFrequency] {
    let stopWords: Set<String> = ["은", "는", "이", "가", "을", "를", "에", "도", "으로", "해서", "인데", "부터", "까지", "하고", "그리고", "그런데", "그러면"]
    let allWords = answers.joined(separator: " ")
        .components(separatedBy: .whitespacesAndNewlines)
        .map { $0.trimmingCharacters(in: .punctuationCharacters) }
        .filter { !$0.isEmpty && $0.count >= 2 }
    
    let freqDict = Dictionary(grouping: allWords, by: { $0 }).mapValues { $0.count }
    let sorted = freqDict.sorted { $0.value > $1.value }.prefix(10)
    return sorted.map { WordFrequency(word: $0.key, count: $0.value) }
}

func generateOneLineSummary(from keywords: [String], subject: String) -> String {
    guard let topKeyword = keywords.first else {
        return "[\(subject)] 과제에 대해 요약할 정보가 부족해요."
    }

    return "‘\(topKeyword)’이(가) \(subject) 과제를 미루는 주요 이유로 나타났어요."
}


struct SummaryView: View {
    let subject: String
    let tasks: [String]
    let answers: [String]
    @Binding var path: NavigationPath

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let wordFreqs = extractWordFrequencies(from: answers)
        let keywords = wordFreqs.map { $0.word }

        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("📝 \(subject) 과제 요약")
                    .font(.title)
                    .bold()

                Text(generateOneLineSummary(from: keywords, subject: subject))
                    .font(.headline)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .cornerRadius(10)

                Chart(wordFreqs) { item in
                    BarMark(
                        x: .value("단어", item.word),
                        y: .value("빈도수", item.count)
                    )
                }
                .frame(height: 250)

                Divider()
                Text("📚 전체 답변")
                    .font(.headline)

                ForEach(answers.indices, id: \.self) { i in
                    Text("Q\(i+1): \(answers[i])")
                        .padding(.vertical, 2)
                }

                Button("저장하기") {
                    let todo = Todo(
                        id: UUID(),
                        subject: subject,
                        tasks: tasks,
                        answers: answers,
                        createdAt: Date()
                    )
                    TodoManager.saveTodo(todo)
                    

                    path.append("total")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(10)
            }
            .padding()
        }
    }
}
