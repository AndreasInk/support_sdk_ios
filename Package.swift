// swift-tools-version:5.8
import PackageDescription
let package = Package(
    name: "ZendeskSupportSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ZendeskSupportSDK",
            targets: [
              "ZendeskSupportSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskSupportProvidersSDK",
                 url: "https://github.com/zendesk/support_providers_sdk_ios",
                 .exact("6.0.0")),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/zendesk/messaging_sdk_ios",
                 .exact("4.0.0"))
    ],
    targets: [
        .binaryTarget(
            name: "SupportSDK",
            path: "SupportSDK.xcframework"
        ),
        .target(name: "ZendeskSupportSDKTargets",
                dependencies: [
                    .target(name: "SupportSDK"),
                    .product(name: "ZendeskSupportProvidersSDK", package: "ZendeskSupportProvidersSDK"),
                    .product(name: "ZendeskMessagingSDK", package: "ZendeskMessagingSDK")
                ],
                path: "Sources"
        )
    ]
)
