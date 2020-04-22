//
//  ShellCommand.swift
//  InstallSwiftScriptCore
//
//  Created by Vishal Singh on 22/04/20.
//

import Foundation
import ShellOut

enum ShellCommand {
    case createSwiftReleaseBuild
    case copyBuildArtefactToUserLocalBin(projectName: String, toolName: String)

    var command: String {
        switch self {
        case .createSwiftReleaseBuild: return "swift"
        case .copyBuildArtefactToUserLocalBin: return "cp"
        }
    }
    
    var arguments: [String] {
        switch self {
        case .createSwiftReleaseBuild: return ["build", "-c", "release"]
        case .copyBuildArtefactToUserLocalBin(let projectName, let toolName): return ["-f", ".build/release/\(projectName)", "/usr/local/bin/\(toolName)"]
        }
    }
    
    var successMessage: String {
            switch self {
            case .createSwiftReleaseBuild: return "Successfully created release artefacts."
            case .copyBuildArtefactToUserLocalBin(let projectName, let toolName): return "Successfully copied .build/release/\(projectName) to /usr/local/bin/\(toolName)). You can now run \(toolName) as a command from Terminal. :]"
            }
        }

    func execute(onSuccess: ((String) -> Void)? = nil, onFailure: ((ShellOutError) -> Void)? = nil) {
        do {
            let output = try shellOut(to: command, arguments: arguments)
            if let onSuccess = onSuccess {
                onSuccess(output)
            } else {
                print(output)
                print(successMessage)
            }
        } catch let error {
            let error = error as! ShellOutError
            if let onFailure = onFailure {
                onFailure(error)
            } else {
                print(error.message) // Prints STDERR
                print(error.output) // Prints STDOUT
            }
        }
    }
}
