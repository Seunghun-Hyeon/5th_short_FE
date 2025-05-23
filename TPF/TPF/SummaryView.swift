import SwiftUI
import Charts

struct WordFrequency: Identifiable {
    var id: String { word }
    let word: String
    let count: Int
}

func extractWordFrequencies(from answers: [String]) -> [WordFrequency] {
    let stopWords: Set<String> = ["은", "는", "이", "가", "을", "를", "에", "도", "으로", "해서", "인데", "부터", "까지", "하고", "그리고", "그런데", "그러면","해요","요","이라"]

    let allWords = answers.joined(separator: " ")
        .components(separatedBy: .whitespacesAndNewlines)
        .map { $0.trimmingCharacters(in: .punctuationCharacters) }

    let cleanedWords = allWords.map { word in
        stopWords.reduce(word) { partial, stop in
            partial.hasSuffix(stop) ? String(partial.dropLast(stop.count)) : partial
        }
    }
        .filter { !$0.isEmpty && $0.count >= 2 }

    let freqDict = Dictionary(grouping: cleanedWords, by: { $0 }).mapValues { $0.count }
    let sorted = freqDict.sorted { $0.value > $1.value }.prefix(10)
    return sorted.map { WordFrequency(word: $0.key, count: $0.value) }
}


func generateOneLineSummary(from keywords: [String], subject: String) -> String {
    guard !keywords.isEmpty else {
        return "[\(subject)] 과제에 대해 요약할 정보가 부족해요."
    }
    if keywords.count == 1 {
        return "‘\(keywords[0])’이(가) \(subject) 과제를 미루는 주요 이유로 나타났어요."
    } else if keywords.count == 2 {
        return "\(keywords[0])과 \(keywords[1])이(가) \(subject) 과제를 진행하는 데 영향을 주고 있어요."
    } else {
        let prefix = keywords.dropLast().joined(separator: ", ")
        let last = keywords.last!
        return "\(prefix) 그리고 \(last) 관련 문제가 \(subject) 과제를 미루는 원인으로 보입니다."
    }
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

                Button("✅ 저장하고 메인으로") {
                    let todo = Todo(
                        id: UUID(),
                        subject: subject,
                        tasks: tasks,
                        answers: answers,
                        createdAt: Date()
                    )
                    TodoManager.saveTodo(todo)
                    
                    // ✅ path 비우면 MainView로 이동
                    path.removeLast(path.count)
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
