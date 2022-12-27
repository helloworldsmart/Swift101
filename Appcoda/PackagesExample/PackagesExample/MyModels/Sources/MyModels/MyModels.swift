import Foundation

public struct MyModels {
  public init() {}
    @available(macOS 10.15, *)
    public class ContentViewModel: ObservableObject {
    @Published public var hellos = 0
    public init() {}
    public func hello() {
      hellos += 1
    }
  }
}
