import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    private static let organizationName: String = "juntaek.OH"
    
    /// Helper function to create the Project for this ExampleApp
    public static func app(name: String, platform: Platform, iOSTargetVersion: String, dependencies: [TargetDependency]) -> Project {
        
        let targets = makeAppTargets(name: name,
                                     platform: platform,
                                     iOSTargetVersion: iOSTargetVersion,
                                     dependencies: dependencies)
        
        return Project(name: name,
                       organizationName: organizationName,
                       targets: targets)
    }
    
    public static func framework(name: String, platform: Platform, iOSTargetVersion: String, dependencies: [TargetDependency]) -> Project {
        let targets = makeFrameworkTargets(name: name,
                                            platform: platform,
                                            iOSTargetVersion: iOSTargetVersion,
                                            dependencies: dependencies)
        
        return Project(name: name,
                       organizationName: organizationName,
                       targets: targets)
    }

    // MARK: - Private

    /// Helper function to create a framework target and an associated unit test target
    private static func makeFrameworkTargets(name: String, platform: Platform, iOSTargetVersion: String, dependencies: [TargetDependency]) -> [Target] {
        let sources = Target(name: name,
                platform: platform,
                product: .framework,
                bundleId: "com.TuistTest.\(name)",
                deploymentTarget: .iOS(targetVersion: iOSTargetVersion,
                                       devices: [.iphone, .ipad]),
                infoPlist: .default,
                sources: ["Targets/\(name)/Sources/**"],
                resources: [],
                dependencies: dependencies)
        let tests = Target(name: "\(name)Tests",
                platform: platform,
                product: .unitTests,
                bundleId: "com.TuistTest.\(name)Tests",
                infoPlist: .default,
                sources: ["Targets/\(name)/Tests/**"],
                resources: [],
                dependencies: [.target(name: name)])
        return [sources, tests]
    }

    /// Helper function to create the application target and the unit test target.
    private static func makeAppTargets(name: String, platform: Platform, iOSTargetVersion: String, dependencies: [TargetDependency]) -> [Target] {
        let platform: Platform = platform
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
            ]

        let mainTarget = Target(
            name: name,
            platform: platform,
            product: .app,
            bundleId: "com.TuistTest.\(name)",
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion,
                                   devices: [.iphone, .ipad]),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "com.TuistTest.\(name)Tests",
            infoPlist: .default,
            sources: ["Targets/\(name)/Tests/**"],
            dependencies: [
                .target(name: "\(name)")
        ])
        
        return [mainTarget, testTarget]
    }
}
