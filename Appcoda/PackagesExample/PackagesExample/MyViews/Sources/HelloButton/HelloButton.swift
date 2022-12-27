//
//  File.swift
//  
//
//  Created by Michael on 2022/12/27.
//

import SwiftUI

public struct HelloButton: View {
  let action: () -> Void
  public init(action: @escaping () -> Void) {
    self.action = action
  }
  
  public var body: some View {
    Button("Hello", action: action)
      .buttonStyle(HelloButtonStyle())
  }
}

public struct HelloButtonStyle: ButtonStyle {
  public func makeBody(configuration: Configuration) -> some View {
    Group {
      configuration.label
        .foregroundColor(.white)
        .padding()
        .background(Color.red)
        .cornerRadius(15)
    }
    .frame(maxWidth: .infinity, alignment: .center)
  }
}
