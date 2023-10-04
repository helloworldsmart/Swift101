//
//  FeedbackRatingView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/4.
//

import SwiftUI

//struct FeedbackRatingView<Content: View>: View {
//    @ViewBuilder let content: Content
//
//    var body: some View {
//        content
//            .padding(.horizontal, 12)
//            .padding(16)
//    }
//}

struct FeedbackRatingView<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
            .padding(.horizontal, 12)
            .padding(16)
    }
}


extension View {
    func feedbackRatingAlert<Content: View>(
        isPresented: Binding<Bool>,
        message: Binding<String>,
        textStyle: Binding<UIFont.TextStyle>,
        placeholderText: Binding<String>,
        rating: Binding<Int>,
        isLoading: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) -> some View {
        self.overlay(
            ZStack(alignment: .center) {
                
                if isPresented.wrappedValue {
                    FeedbackRatingView {
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    isPresented.wrappedValue = false
                                    rating.wrappedValue = 0
                                }) {
                                    Image("icon_close")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                }
                            }
                            VStack {
                                Spacer()
                                Section {
                                    RatingView(rating: rating)
                                    ZStack {
                                        if message.wrappedValue.isEmpty {
                                            TextEditor(text: placeholderText)
                                                .frame(width: 212, height: 80)
                                                .cornerRadius(5.0)
                                                .font(.body)
                                                .foregroundColor(.gray)
                                                .disabled(true)
                                                .padding()
                                        }
                                        TextEditor(text: message)
                                            .frame(width: 212, height: 80)
                                            .cornerRadius(5.0)
                                            .font(.body)
                                            .opacity(message.wrappedValue.isEmpty ? 0.25 : 1)
                                            .padding()
                                    }
                                } header: {
                                    Text("Did you find our app helpful?")
                                        .font(.custom("Roboto-Regular", size: 16))
                                        .bold()
                                }
                                Button(action: {
                                    rating.wrappedValue = 0
                                    isPresented.wrappedValue = false
                                }) {
                                    Text("submit")
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .font(.system(size: 18))
                                        .padding()
                                        .foregroundColor(.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                }
                                .frame(width: 221)
                                .background(rating.wrappedValue > 0 ? .red : .gray)
                                .cornerRadius(25)
                                .disabled(rating.wrappedValue == 0)
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 3)
                            .background(.white)
                            .cornerRadius(10.0)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .loadingView(isPresented: isLoading)
                        
                    }
                    .background(Color.gray.opacity(0.5))
//                    .zIndex(1)
                }
            }

        )
    }
}

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

extension View {
    func loadingView(isPresented: Binding<Bool>)->some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                ProgressView()
                    .scaleEffect(2)
            }
        }
    }
}

struct FeedbackRatingView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackRatingView {
            Text("Hello World!")
        }
    }
}
