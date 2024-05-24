//
//  APIManager.swift
//  Landmaks
//
//  Created by RASHED on 5/24/24.
//

import UIKit

final class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    // MARK: - Reading and Parsing JSON file
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
    
    
    func fetchLandmarks(jsonData: Data) -> [Landmark]? {
        do {
            let landMarksData = try JSONDecoder().decode([Landmark].self, from: jsonData)
            return landMarksData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}

