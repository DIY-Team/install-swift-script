import ArgumentParser
import Foundation
import ShellOut

struct Installer: ParsableCommand {
    
    @Argument(help: "name of the target in the package")
    var projectName: String

    @Argument(help: "name of the tool to be used from command line")
    var toolName: String

    mutating func run() throws {
        ShellCommand.createSwiftReleaseBuild.execute()
        ShellCommand.copyBuildArtefactToUserLocalBin(projectName: projectName, toolName: toolName).execute()
    }
}
