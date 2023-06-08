//
//  App.swift
//  ProjectDescriptionHelpers
//
//  Created by Zeto on 2023/06/08.
//

import ProjectDescription
import ProjectDescriptionHelpers

private let projectName = "App"
private let iOSTargetVersion = "14.0"

let project = Project.app(name: projectName,
                          platform: .iOS,
                          iOSTargetVersion: iOSTargetVersion,
                          dependencies: [])
