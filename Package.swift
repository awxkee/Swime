// swift-tools-version:5.8
import PackageDescription

let package = Package(
  name: "Swime",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14)
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
