//
//  main.swift
//  CreateFramework
//
//  Created by Duong Yen-Ly on 28/04/2021.
//

import Foundation
import ArgumentParser

struct CreateFrameworks: ParsableCommand {
    @Option(name: .shortAndLong, help: "The path where the framework should be generated in.")
    var path: String?

    @Argument(help: "The name of the framework.")
    var name: String

    func run() throws {
        let defaultPath = path ?? "../Frameworks/"

        let fm = FileManager.default
//        var sourceFilesPath = "../Flag"
//        let items = try fm.contentsOfDirectory(atPath: sourceFilesPath)
//
//        for item in items {
//            print ("CONTENT = " + item)
//        }
//
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        if fileManager.fileExists(atPath: "../Framework", isDirectory:&isDir) {
            if isDir.boolValue {
                print("directory")
                // file exists and is a directory
            } else {
                print ("not directory")
                // file exists and is not a directory
            }
        } else {
            do {
                try FileManager.default.createDirectory(atPath: defaultPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }

            // file does not exist
        }
    }
}

CreateFrameworks.main()
