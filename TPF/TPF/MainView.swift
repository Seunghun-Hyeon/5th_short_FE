//
//  MainView.swift
//  TPF
//
//  Created by 현승훈 on 5/24/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // '#' 제거
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

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
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hex: "F6F7FA"))
                            .frame(height: 260)
                        
                        VStack(spacing: 16) {
                            Image("icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            Text("왜 미루니?")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("과제를 미루게 되는 이유,\n같이 생각해 볼까요?")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
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
                        .background(Color(hex: "7398FB"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                Spacer()
            }
            .navigationBarHidden(true)
            .navigationDestination(for: String.self) { value in
                if value == "total" {
                    TotalView() // 여기에 실제 TotalView 작성돼 있어야 함!
                }
            }
        }
        
    }
}
