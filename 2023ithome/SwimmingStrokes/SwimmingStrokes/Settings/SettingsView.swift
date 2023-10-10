//
//  SettingsView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/1.
//

import SwiftUI

struct SettingsView: View {
    
    @State var showingFeedback: Bool = false
    @State private var message: String = ""
    @State private var textStyle = UIFont.TextStyle.body
    @State private var rating: Int = 0
    @State private var placeholderText: String = "有什麼需要我可以幫忙的呀☕️"
    @State private var isLoading: Bool = false
    
    @State private var textViewMessage = ""
    @State private var textViewTextStyle = UIFont.TextStyle.body
    
    var body: some View {
        VStack {
            Text("Hello, SettingsView 🚧")
            Section {
                HStack{
                    Image(systemName: "heart.text.square")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Button {
                        showingFeedback.toggle()
                    } label: {
                        Text("Feedback")
                    }
                    TextView(text: $textViewMessage, textStyle: $textViewTextStyle)
                        .padding(.horizontal)
                }
            }
        }
        .feedbackRatingAlert(isPresented: $showingFeedback,
                             message: $message,
                             textStyle: $textStyle,
                             placeholderText: $placeholderText,
                             rating: $rating,
                             isLoading: $isLoading) {
            
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
