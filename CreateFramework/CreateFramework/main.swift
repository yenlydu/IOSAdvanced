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

    func checkDirectoryExist(name: String) -> Bool
    {
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        if (fileManager.fileExists(atPath: name, isDirectory:&isDir)) {
            if (isDir.boolValue) {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }


    func createDirectory(defaultPath: String)
    {
        let checkDirectory = checkDirectoryExist(name: defaultPath)

        if (checkDirectory == false) {
            do {
                try FileManager.default.createDirectory(atPath: defaultPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print ("A directory or a file already has this name.")
        }
    }

    func catchWritableFile(modifiedFileName : String) -> String
    {
        do {
            return try String(contentsOfFile: modifiedFileName)
        } catch(_) {
            return String();
        }
    }

    func writeFileContent(defaultPath: String, item: String)
    {
        let modifiedFileName = defaultPath + "/\(name)/\(item)"
        var content = catchWritableFile(modifiedFileName: modifiedFileName)
        content = content.replacingOccurrences(of: "__TEMPLATE__", with: name, options: .literal, range: nil)
        if (!content.isEmpty) {
            do {
                try content.write(toFile: modifiedFileName, atomically: true, encoding: String.Encoding.utf8)
            } catch (let error) {
                print(error.localizedDescription)
            }
        } else {
//            print("nil")
        }

    }
    
    func createFrameworkFolderContent(defaultPath: String)
    {
        var newString = String();

        try? FileManager.default.copyItem(atPath: "../Template/Template/", toPath: defaultPath + "/\(name)")
        let items = try? FileManager.default.contentsOfDirectory(atPath: defaultPath + "/\(name)")
        for item in items! {
            if (item.contains("__TEMPLATE__")) {
                newString = item.replacingOccurrences(of: "__TEMPLATE__", with: name , options: .literal, range: nil)
                do {
                    try FileManager.default.moveItem(atPath: defaultPath + "/\(name)/\(item)", toPath: defaultPath + "/\(name)/\(newString)")
                } catch(let error) {
                    print (error)
                }
            }
            if (newString.isEmpty) {
                writeFileContent(defaultPath: defaultPath, item: item)
            } else {
                writeFileContent(defaultPath: defaultPath, item: newString)
            }
            newString = String();
        }

    }

    func run() throws {
        let defaultPath = path ?? "../Frameworks/"

        createDirectory(defaultPath: defaultPath)
        createFrameworkFolderContent(defaultPath: defaultPath)
    }
}

CreateFrameworks.main()
