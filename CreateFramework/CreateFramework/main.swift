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

    
    func checkDirectoryExist(name: String) -> Int
    {
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        if (fileManager.fileExists(atPath: name, isDirectory:&isDir)) {
            if (isDir.boolValue) {
                return 1
            } else {
                return 0
            }
        } else {
            return -1
        }
    }
    
    func createDirectory(defaultPath: String)
    {
        let sourceCodeFolder = "../Flag/Code"
        let checkDirectory = checkDirectoryExist(name: defaultPath)
        if (checkDirectory == -1) {
            do {
                try FileManager.default.createDirectory(atPath: defaultPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print ("A file or a directory already has this name.")
        }
    }

    func run() throws {
        let defaultPath = path ?? "../Frameworks/"
        createDirectory(defaultPath: defaultPath)
    }
}

CreateFrameworks.main()
