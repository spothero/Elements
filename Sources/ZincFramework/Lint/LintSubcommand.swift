// Copyright © 2020 SpotHero, Inc. All rights reserved.

import ArgumentParser
import FileHero
import Lumberjack
import ShellRunner

struct LintSubcommand: ParsableCommand {
    // MARK: Command Configuration
    
    static var configuration = CommandConfiguration(
        commandName: "lint",
        abstract: "Performs basic linting against a Zincfile to identify issues and errors."
    )
    
    // MARK: Options
    
    /// The Zincfile to parse.
    @Option(name: .shortAndLong, help: "The Zincfile to parse and lint. Will default to the Zincfile in the root if left unspecified.")
    private var file: String?
    
    // MARK: Methods
    
    func run() throws {
        try self.lint(self.file)
    }
    
    func lint(_ filename: String? = nil) throws {
        guard try ZincfileParser.shared.fetch(filename) != nil else {
            return
        }
        
        Lumberjack.shared.log("\(filename ?? "Zincfile") linted successfully.")
    }
}
