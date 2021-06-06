//
//  ShellCommand.swift
//  InstallSwiftScriptCore
//
//  Created by Vishal Singh on 22/04/20.
//

import Foundation
import RunsShellCommand

public enum ShellCommand: AnyShellCommand {
    case createSwiftReleaseBuild
    case copyBuildArtefactToUserLocalBin(projectName: String, toolName: String)
    
    public var command: String {
        get {
            switch self {
            case .createSwiftReleaseBuild: return "swift"
            case .copyBuildArtefactToUserLocalBin: return "cp"
            }
        }
    }
    
    public var defaultArguments: [String] {
        get {
            switch self {
            case .createSwiftReleaseBuild: return ["build", "-c", "release"]
            case .copyBuildArtefactToUserLocalBin(let projectName, let toolName): return ["-f", ".build/release/\(projectName)", "/usr/local/bin/\(toolName)"]
            }
        }
    }

    public func execute() {
        execute(with: [], atPath: ".")
    }
}
