import ArgumentParser
import Foundation
import ShellOut

public struct Installer: ParsableCommand {
    
    @Argument(help: "name of the target in the package")
    public var projectName: String

    @Argument(help: "name of the tool to be used from command line")
    public var toolName: String
    
    public init() {}

    public mutating func run() throws {
        ShellCommand.createSwiftReleaseBuild.execute()
        ShellCommand.copyBuildArtefactToUserLocalBin(projectName: projectName, toolName: toolName).execute()
    }
}
