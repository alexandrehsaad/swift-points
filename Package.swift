// swift-tools-version:5.6

import PackageDescription

let package: Package = .init(
	name: "swift-points",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.macCatalyst(.v15),
		.macOS(.v10_15),
		.watchOS(.v6)
	],
	products: [
		.library(name: "Points", targets: ["Points"])
	],
	dependencies: [
		.package(url: "https://github.com/alexandrehsaad/swift-contributors-plugin", branch: "main"),
		.package(url: "https://github.com/alexandrehsaad/swift-numeric-protocols.git", branch: "main"),
		.package(url: "https://github.com/apple/swift-docc-plugin.git", .upToNextMinor(from: "1.0.0"))
	],
	targets: [
		.target(
			name: "Points",
			dependencies: [
				.product(name: "NumericProtocols", package: "swift-numeric-protocols")
			],
			path: "Sources"
		),
		.testTarget(
			name: "PointsTests",
			dependencies: ["Points"],
			path: "Tests",
			resources: [
				.process("PointsTests/Resources")
			]
		)
	],
	swiftLanguageVersions: [.v5]
)
