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
        .package(url: "https://github.com/onesdkspm/AOUnityWebBridge.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/BTSimpleHTTPNetworking.git", from: "2.0.0"),
        .package(url: "https://github.com/onesdkspm/UnityBridge.git", from: "2.0.0"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/UnityQuestionnaireManager/1.1.2/UnityQuestionnaireManager.xcframework.zip",
            checksum: "39a0e5ed7bc33579acb53570a2a9bf36844f5c7befc9efb558b5e81d45433a86"
        )
    ]
)
