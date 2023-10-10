//
//  TextView.swift
//  SwimmingStrokes
//
//  Created by Michael on 2023/10/10.
//

import SwiftUI

// Part 1
//struct CustomView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

// Part 2
//struct CustomView: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> some UIView {
//        // Return the UIView object
//    }
//
//    func updateUIView(_ uiView: some UIView, context: Context) {
//        // Update the view
//    }
//}

//
struct TextView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var textStyle: UIFont.TextStyle
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: textStyle)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        // Update the view
        uiView.text = text
        uiView.font = UIFont.preferredFont(forTextStyle: textStyle)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        
        init(_ text: Binding<String>) {
            self.text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
        }
    }
    
}

//struct TextView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextView(text: "", textStyle: UIFont.TextStyle.body)
//    }
//}
