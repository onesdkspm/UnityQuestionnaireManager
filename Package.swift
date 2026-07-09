// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "UnityQuestionnaireManager",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "UnityQuestionnaireManager",
            targets: ["UnityQuestionnaireManagerWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/AOUnityWebBridge.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/BTSimpleHTTPNetworking.git", from: "2.0.3"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.3"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "UnityQuestionnaireManagerWrapper",
            dependencies: [
                .byName(name: "UnityQuestionnaireManager"),
                .product(name: "AOUnityWebBridge", package: "AOUnityWebBridge"),
                .product(name: "BTSimpleHTTPNetworking", package: "BTSimpleHTTPNetworking"),
                .product(name: "UnityBridge", package: "UnityBridge"),
            ],
            path: "UnityQuestionnaireManagerWrapper",
            linkerSettings: [
                // iOS 系统框架
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "UnityQuestionnaireManager",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityQuestionnaireManager/2.0.3-dev-1482674/UnityQuestionnaireManager.xcframework.zip",
            checksum: "ef5c056fc9bafc01693d545b4e53f2816985ee7454ccefbe3455586e1f396d06"
        )
    ]
)
