// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: MyViews

let myViews = "MyViews"
let myViewsTarget: Target = .target(name: myViews)
let myViewsTargetDependency: Target.Dependency = .target(name: myViews)

// MARK: HelloButton

let helloButton = "HelloButton"
let helloButtonTarget: Target = Target.target(name: helloButton, dependencies: [myViewsTargetDependency])
let platforms: [SupportedPlatform]? = [.iOS(.v15)]

// MARK: Product

let libraryProduct: Product = .library(name: myViews, targets: [helloButton])

let package = Package(
  name: myViews,
  platforms: platforms,
  products: [libraryProduct],
  targets: [myViewsTarget, helloButtonTarget]
)

//let package = Package(
//    name: "MyViews",
//    products: [
//        // Products define the executables and libraries a package produces, and make them visible to other packages.
//        .library(
//            name: "MyViews",
//            targets: ["MyViews"]),
//        .library(
//            name: "HelloButton",
//            targets: ["HelloButton"]),
//    ],
//    dependencies: [
//        // Dependencies declare other packages that this package depends on.
//        // .package(url: /* package url */, from: "1.0.0"),
//    ],
//    targets: [
//        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
//        // Targets can depend on other targets in this package, and on products in packages this package depends on.
//        .target(
//            name: "MyViews",
//            dependencies: []),
//        .target(
//            name: "HelloButton",
//            dependencies: []),
//        .testTarget(
//            name: "MyViewsTests",
//            dependencies: ["MyViews"]),
//    ]
//)
