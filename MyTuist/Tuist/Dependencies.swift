//
//  Dependencies.swift
//  MyTuistManifests
//
//  Created by Zeto on 2023/06/08.
//

import ProjectDescription

let dependencies: Dependencies = .init(
    carthage: [],
    swiftPackageManager: [
        .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .upToNextMajor(from: "5.0.0"))
    ],
    platforms: [.iOS]
)
