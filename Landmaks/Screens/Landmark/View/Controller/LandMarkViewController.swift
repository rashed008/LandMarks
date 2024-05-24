//
//  LandMarkViewController.swift
//  Landmaks
//
//  Created by RASHED on 5/24/24.
//

import UIKit

class LandMarkViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var landMarkTableView: UITableView!
    
    //MARK: - Variables
    private var viewModel = LandmarkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}

extension LandMarkViewController {
    func configuration() {
        observeEvent()
        setUpTableView()
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self = self else { return }
            switch event {
            case .loading:
                print("Loading ......")
            case .stopLoading:
                print("Stop loading ....")
            case .dataLoaded:
                print("Data Loaded: \(self.viewModel.landMarksDataList)")
            case .error(let error):
                print("Error: \(error)")
            }
        }
        viewModel.fetchLandMarks()
    }
}


extension LandMarkViewController {
    private func registerCell() {
        landMarkTableView.register(TableViewCell.landmarkTableViewCell.nib, forCellReuseIdentifier: TableViewCell.landmarkTableViewCell.identifier)
    }
    
    private func setUpTableView() {
        registerCell()
        landMarkTableView.delegate = self
        landMarkTableView.dataSource = self
    }
}


extension LandMarkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.landMarksDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.landmarkTableViewCell.identifier, for: indexPath) as? LandmarkTableViewCell else {
            return UITableViewCell()
        }
        let landmarks = viewModel.landMarksDataList[indexPath.row]
        cell.landmark = landmarks
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


extension LandMarkViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell index \(indexPath.row + 1)")
    }
    
}

