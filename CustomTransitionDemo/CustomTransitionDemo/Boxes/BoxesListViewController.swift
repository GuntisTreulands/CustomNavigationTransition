//
//  BoxesListViewController.swift
//  CustomTransitionDemo
//
//  Created by Guntis on 26/06/2019.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

class BoxesListViewController: UIViewController, PopTransitionAnimatorFinaliseHelperProtocol {
	var selectedButton: UIButton?
	let coordinator = TransitionCoordinator()

	// MARK: View loading

	override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Boxes list"
    }

	// MARK: Functions

	@IBAction func boxWasPressed(_ sender: UIButton) {
		guard let vc = storyboard?.instantiateViewController(withIdentifier: "boxesMapViewController") as? BoxesMapViewController else {
			return
		}
		// Set it, when going to specific view, and remove it, when coming back from specific view.
		// Thus, this will be only working for this function.
		navigationController?.delegate = coordinator

		vc.originalBoxRect = sender.frame
		self.navigationController?.pushViewController(vc, animated: true)
		sender.isHidden = true
		selectedButton = sender
	}

	// MARK: PopTransitionAnimatorFinaliseHelperProtocol

	func customTransitionWasFinished() {
		// Unhide button after animation is done, and remove custom transition delegate.
		// By removing custom transition delegate, we can use default transition to different app place.
		selectedButton?.isHidden = false
		navigationController?.delegate = nil
	}
}

