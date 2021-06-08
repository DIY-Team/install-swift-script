# install-swift-script

InstallSwiftScript is a tool as its name suggest, can be used to install a swift script or swift executable product, as a command. This would allow the executable to be used from anywhere on the user's machine.
It can also be used as a library to implement your own installation options. 
On its own this tool doesn't do anything significant other than getting itself installed as a command.

# Installation as a tool

The installation of  `install-ss` command can be done in following ways. After you have cloned and checked in on the repo's root folder:

`git clone https://github.com/DIY-Team/install-swift-script.git`

`cd install-swift-script` 

## Method 1
using shell script:
`sh install.sh`

## Method 2
using swift run:
`swift run InstallSwiftScript InstallSwiftScript install-ss`

*Note: feel free to use any other name instead of `install-ss` if you would like to*

# Usage

## As a command

Use this as an installation tool for other swift executables. e.g.

`cd /path/to/root/folder/of/a/swift/package/` (root folder is where the `Package.swift` file resides)

`install-ss AnExecutableSwiftProduct short-command`

This would mean that all the functionality of the `AnExecutableSwiftProduct` would be available in the terminal under `short-command`. Now  `short-command` can be run from anywhere. 


## As a library

You can also create a executable Install target

add this to the dependencies array of your package:

`.package(url: "https://github.com/DIY-Team/install-swift-script.git", from: "0.3.1"),`

and this to the target dependencies in which you want to use the library:

`.product(name: "InstallSwiftScriptCore", package: "install-swift-script"),`

Now, in the target main file, you can do this:

```
import InstallSwiftScriptCore

Installer.main(["<executatble-target-name>", "cmd-name"])

// or just this
Installer.main()
```


# Uninstallation

runthe following commad in terminal 
`rm -rf /usr/local/bin/install-ss`

(if you named it something else, please use that name in place of `install-ss`)
