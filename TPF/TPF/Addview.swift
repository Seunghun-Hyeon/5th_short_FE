//
//  Addview.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//


import SwiftUI

struct AddView: View {
    @State private var subjectName: String = ""
    @State private var tasks: [String] = [""]
    @State private var goToNext = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Form {
                    Section(header: Text("과목명")) {
                        TextField("예: 자료구조", text: $subjectName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    Section(header: Text("세부 할 일")) {
                        ForEach(tasks.indices, id: \.self) { index in
                            HStack {
                                Text("\(index + 1).")
                                TextField("예: 3주차 과제 제출", text: $tasks[index])
                            }
                        }

                        Button(action: {
                            tasks.append("")
                        }) {
                            Label("할 일 추가", systemImage: "plus")
                                .foregroundColor(.blue)
                        }
                    }
                }

                Spacer()

                NavigationLink(destination: Question_1(), isActive: $goToNext) {
                    EmptyView()
                }

                Button(action: {
                    print("과목명: \(subjectName)")
                    print("할 일 목록: \(tasks.filter { !$0.isEmpty })")
                    goToNext = true
                }) {
                    Text("다음으로")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .navigationTitle("할 일 추가")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddView()
}
