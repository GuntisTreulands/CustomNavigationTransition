//
//  DataListViewController.swift
//  CustomTransitionDemo
//
//  Created by Guntis on 03/09/2019.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

class DataListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PopTransitionAnimatorFinaliseHelperProtocol {
	@IBOutlet var tableView: UITableView!
	
	var data: [Forest]!
	let coordinator = TransitionCoordinator()
	var selectedCell: DataListTableViewCell!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Data list"
		
		data = Forest.getAllForests()
	
		tableView.separatorStyle = .none
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(UINib(nibName: "DataListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

	func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return data.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DataListTableViewCell {
			cell.dataCellView.titleLabel.text = data[indexPath.row].name
			cell.dataCellView.descriptionLabel.text = data[indexPath.row].description
			cell.dataCellView.iconImageView.image = UIImage.init(named: data[indexPath.row].smallImageName)
			cell.selectionStyle = .none
			
			if data.count == 1 {
				cell.dataCellView.setAsCellType(cellType: .single)
			} else {
				if indexPath.row == 0 {
					cell.dataCellView.setAsCellType(cellType: .top)
				} else if data.count - 1 == indexPath.row {
					cell.dataCellView.setAsCellType(cellType: .bottom)
				} else {
					cell.dataCellView.setAsCellType(cellType: .middle)
				}
			}
			
			return cell
		} else {
			fatalError("Did not find a correct cell.")
		}
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let vc = storyboard?.instantiateViewController(withIdentifier: "dataMapViewController") as? DataMapViewController else {
			return
		}
		// Set it, when going to specific view, and remove it, when coming back from specific view.
		// Thus, this will be only working for this function.
		navigationController?.delegate = coordinator
		
		vc.forest = data[indexPath.row]
	
		let rect = tableView.rectForRow(at: indexPath)
		let rectInScreen = tableView.convert(rect, to: self.view)

		vc.dataCellOrinalFrame = rectInScreen
		
		
		if data.count == 1 {
			vc.cellType = .single		
		} else {
			if indexPath.row == 0 {
				vc.cellType = .top
			} else if data.count - 1 == indexPath.row {
				vc.cellType = .bottom
			} else {
				vc.cellType = .middle
			}
		}
		
		selectedCell = tableView.cellForRow(at: indexPath) as? DataListTableViewCell
		selectedCell.isHidden = true
		
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	// MARK: PopTransitionAnimatorFinaliseHelperProtocol
	
	func customTransitionWasFinished() {
		// Unhide button after animation is done, and remove custom transition delegate.
		// By removing custom transition delegate, we can use default transition to different app place.
		navigationController?.delegate = nil
		
		selectedCell.isHidden = false
	}
}
