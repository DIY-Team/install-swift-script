import Foundation
import ShellOut

public final class InstallSwiftScript {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        let projectName: String
        let toolName: String
        print(arguments as AnyObject)
        if arguments.count > 2 {
            projectName = arguments[1]
            toolName = arguments[2]
        } else {
            fatalError("Must specify: the project name and expected tool name")
        }
        
        ShellCommand.createSwiftReleaseBuild.execute()
        ShellCommand.copyBuildArtefactToUserLocalBin(projectName: projectName, toolName: toolName).execute()
    }
}

