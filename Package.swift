// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "calctl",
  platforms: [.macOS(.v14)],
  products: [
    .library(name: "CalendarCore", targets: ["CalendarCore"]),
    .executable(name: "calctl", targets: ["calctl"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CalendarCore",
      dependencies: [],
      linkerSettings: [
        .linkedFramework("EventKit"),
      ]
    ),
    .executableTarget(
      name: "calctl",
      dependencies: [
        "CalendarCore",
      ],
      exclude: [
        "Resources/Info.plist",
      ],
      linkerSettings: [
        .unsafeFlags([
          "-Xlinker", "-sectcreate",
          "-Xlinker", "__TEXT",
          "-Xlinker", "__info_plist",
          "-Xlinker", "Sources/calctl/Resources/Info.plist",
        ]),
      ]
    ),
  ]
)
