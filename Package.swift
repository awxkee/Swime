// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Swime",
  platforms: [
    .iOS(.v9),
    .macOS(.v10_10)
  ],
  products: [
    .library(name: "Swime", targets: ["Swime"])
  ],
  dependencies: [

  ],
  targets: [
    .target(
      name: "Swime",
      path: "./Sources"
   ),
    .testTarget(
      name: "SwimeTests",
      dependencies: [
        "Swime",
      ]
    )
  ]
)
