import InstallSwiftScriptCore

let tool = InstallSwiftScript()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}
