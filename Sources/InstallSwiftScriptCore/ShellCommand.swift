//
//  ShellCommand.swift
//  InstallSwiftScriptCore
//
//  Created by Vishal Singh on 22/04/20.
//

import Foundation
import RunsShellCommand

enum ShellCommand: AnyShellCommand {
    case createSwiftReleaseBuild
    case copyBuildArtefactToUserLocalBin(projectName: String, toolName: String)
    
    var command: String {
        get {
            switch self {
            case .createSwiftReleaseBuild: return "swift"
            case .copyBuildArtefactToUserLocalBin: return "cp"
            }
        }
        set {}
    }
    
    var defaultArguments: [String] {
        get {
            switch self {
            case .createSwiftReleaseBuild: return ["build", "-c", "release"]
            case .copyBuildArtefactToUserLocalBin(let projectName, let toolName): return ["-f", ".build/release/\(projectName)", "/usr/local/bin/\(toolName)"]
                
            }
        }
        set {}
    }
    
    var successMessage: String? {
        get {
            switch self {
            case .createSwiftReleaseBuild: return "Successfully created release artefacts."
            case .copyBuildArtefactToUserLocalBin(let projectName, let toolName): return "Successfully copied .build/release/\(projectName) to /usr/local/bin/\(toolName)). You can now run \(toolName) as a command from Terminal. :]"
            }
        }
        set {}
    }
}
