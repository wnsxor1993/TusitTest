//
//  Workspace.swift
//  MyTuistManifests
//
//  Created by Zeto on 2023/06/08.
//

import ProjectDescription

let appName: String = "MyTuist"
let workspace: Workspace = .init(
    name: appName,
    projects: [
        "Projects/MyTuistApp"
    ]
)
