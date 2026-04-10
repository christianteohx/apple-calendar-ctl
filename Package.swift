// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "calendarctl",
  platforms: [.macOS(.v14)],
  products: [
    .library(name: "CalendarCore", targets: ["CalendarCore"]),
    .executable(name: "calendarctl", targets: ["calendarctl"]),
  ],
  dependencies: [
    .package(url: "https://github.com/steipete/Commander.git", from: "0.2.0"),
  ],
  targets: [
    .target(
      name: "CalendarCore",
      dependencies: [],
      linkerSettings: [
        .linkedFramework("EventKit"),
      ]
    ),
    .executableTarget(
      name: "calendarctl",
      dependencies: [
        "CalendarCore",
        .product(name: "Commander", package: "Commander"),
      ],
      exclude: [
        "Resources/Info.plist",
      ],
      linkerSettings: [
        .unsafeFlags([
          "-Xlinker", "-sectcreate",
          "-Xlinker", "__TEXT",
          "-Xlinker", "__info_plist",
          "-Xlinker", "Sources/calendarctl/Resources/Info.plist",
        ]),
      ]
    ),
  ]
)
