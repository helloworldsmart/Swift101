//public struct MyViews {
//    public private(set) var text = "Hello, World!"
//
//    public init() {
//    }
//}

import SwiftUI

public struct MyViews {
  
  public struct HelloButton: View {
    let action: () -> Void
    public init(action: @escaping () -> Void) {
      self.action = action
    }
    
      @available(macOS 10.15, *)
      public var body: some View {
      Button("Hello", action: action)
        .buttonStyle(HelloButtonStyle())
    }
  }
  
  public struct HelloButtonStyle: ButtonStyle {
      @available(macOS 10.15, *)
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
  
}
