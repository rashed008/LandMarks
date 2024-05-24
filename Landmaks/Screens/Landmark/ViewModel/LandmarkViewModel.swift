//
//  LandmarkViewModel.swift
//  Landmaks
//
//  Created by RASHED on 5/24/24.
//

import Foundation

final class LandmarkViewModel {
    
    var landMarksDataList: [Landmark] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchLandMarks() {
        self.eventHandler?(.loading)
        
        
        let jsonData = APIManager.shared.readLocalJSONFile(forName: "landmarkData")
        
        self.eventHandler?(.loading)
        if let data = jsonData {
            self.eventHandler?(.stopLoading)
            if let landmarks = APIManager.shared.fetchLandmarks(jsonData: data){
                self.landMarksDataList = landmarks
                self.eventHandler?(.dataLoaded)
            } else {
                self.eventHandler?(.error("Failed to decode JSON data."))
            }
        } else {
            self.eventHandler?(.error("Failed to read JSON file."))
        }
    }
    
}

extension LandmarkViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ message: String)
    }
}

