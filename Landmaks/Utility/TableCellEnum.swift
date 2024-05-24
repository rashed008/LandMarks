//
//  TableCellEnum.swift
//  Landmaks
//
//  Created by RASHED on 5/24/24.
//

import UIKit

enum TableViewCell {
    
    case landmarkTableViewCell
    
    var nib: UINib {
        var nib = UINib()
        switch self {
        case .landmarkTableViewCell:
            nib = UINib(nibName: "LandmarkTableViewCell", bundle: nil)
        }
        return nib
    }
    
    var identifier: String {
        var identifier = ""
        
        switch self {
        case .landmarkTableViewCell:
            identifier = "LandmarkTableViewCell"
        }
        return identifier
    }
}

