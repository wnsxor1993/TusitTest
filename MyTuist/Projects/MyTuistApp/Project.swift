//
//  App.swift
//  ProjectDescriptionHelpers
//
//  Created by Zeto on 2023/06/08.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "MyTuistApp"
private let iOSTargetVersion = "14.0"
private let infoPlist: [String: InfoPlist.Value] = [
        "CFBundleVersion": "1",
        "UILaunchStoryboardName": "LaunchScreen",
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ],
                ]
            ]
        ],
    ]

let project = Project.app(name: projectName,
                          platform: .iOS,
                          iOSTargetVersion: iOSTargetVersion,
                          infoPlist: infoPlist,
                          dependencies: [
                            .external(name: "ReactorKit"),
                            .external(name: "Then"),
                            .external(name: "SnapKit")
                          ])
