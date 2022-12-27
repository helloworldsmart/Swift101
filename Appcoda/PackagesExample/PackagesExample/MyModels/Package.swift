// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: MyModels

let myModels = "MyModels"
let myModelsTarget: Target = .target(name: myModels)
let myModelsTargetDependency: Target.Dependency = .target(name: myModels)

// MARK: ContentViewModel

let contentViewModel = "ContentViewModel"
let contentViewModelTarget: Target = Target.target(name: contentViewModel,
                                                   dependencies: [myModelsTargetDependency])
let platforms: [SupportedPlatform]? = [.iOS(.v15)]

// MARK: Product

let libraryProduct: Product = .library(name: myModels, targets: [contentViewModel])

// MARK: Package

let package = Package(
  name: myModels,
  platforms: platforms,
  products: [libraryProduct],
  targets: [myModelsTarget, contentViewModelTarget]
)

//let package = Package(
//    name: "MyModels",
//    products: [
//        // Products define the executables and libraries a package produces, and make them visible to other packages.
//        .library(
//            name: "MyModels",
//            targets: ["MyModels"]),
//    ],
//    dependencies: [
//        // Dependencies declare other packages that this package depends on.
//        // .package(url: /* package url */, from: "1.0.0"),
//    ],
//    targets: [
//        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
//        // Targets can depend on other targets in this package, and on products in packages this package depends on.
//        .target(
//            name: "MyModels",
//            dependencies: []),
//        .testTarget(
//            name: "MyModelsTests",
//            dependencies: ["MyModels"]),
//    ]
//)
