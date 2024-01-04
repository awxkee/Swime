// swift-tools-version:5.8
import PackageDescription

let package = Package(
  name: "Swime",
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
