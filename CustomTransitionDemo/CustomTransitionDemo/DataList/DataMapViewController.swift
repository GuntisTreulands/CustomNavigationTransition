//
//  DataMapViewController.swift
//  CustomTransitionDemo
//
//  Created by Guntis on 03/09/2019.
//  Copyright © 2019 . All rights reserved.
//

import UIKit
import MapKit

class DataMapViewController: UIViewController, PushTransitionAnimatorHelperProtocol, PopTransitionAnimatorHelperProtocol {

	@IBOutlet var mapView: MKMapView!	
	@IBOutlet var dataCellView: ExpandedDataCellView!
	var tmpYConstant: CGFloat!
	var dataCellOrinalFrame: CGRect!
	var forest: Forest!
	var cellType: CellBackgroundType!
	
	var yOffSetConstraint: NSLayoutConstraint!
	
	// MARK: View loading 
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Data map"
		mapView.alpha = 0
		
		dataCellView = ExpandedDataCellView.init(frame: CGRect.init(x: 0, y: 100, width: self.view.frame.width, height: 100))
		self.view.addSubview(dataCellView)
		yOffSetConstraint = dataCellView.topAnchor.constraint(equalTo: self.view.topAnchor)
		yOffSetConstraint.isActive = true
		dataCellView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
		dataCellView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
		dataCellView.updateData(fromModel: forest, andCellType: cellType)
    }

	override func viewSafeAreaInsetsDidChange() {
		super.viewSafeAreaInsetsDidChange()
		dataCellView.safeLayoutBottomInset = self.view.safeAreaInsets.bottom
	}

	// MARK: PushTransitionAnimatorHelperProtocol

  	func reveal(withDuration duration: TimeInterval, completionHandler: @escaping ((TransitionResult<Bool>) -> Void)) {
		self.yOffSetConstraint.constant = dataCellOrinalFrame.origin.y
		self.view.layoutIfNeeded()

		UIView.animate(withDuration: duration/2) {
			self.mapView.alpha = 1
			self.view.layoutIfNeeded()
		}

		UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: [.curveEaseInOut], animations:
		{
			self.dataCellView.setAsExtended()
			self.view.layoutIfNeeded()
			self.yOffSetConstraint.constant =  self.view.frame.height-self.dataCellView.frame.height
			self.view.layoutIfNeeded()
		}, completion: { (finished: Bool) in
			completionHandler(.success)
		})
	}

  	// MARK: PopTransitionAnimatorHelperProtocol

  	func hide(withDuration duration: TimeInterval, completionHandler: @escaping ((TransitionResult<Bool>) -> Void)) {
  		tmpYConstant = self.yOffSetConstraint.constant

		UIView.animate(withDuration: duration/2) {
			self.mapView.alpha = 0
			self.view.layoutIfNeeded()
		}

		UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: [.curveEaseInOut], animations:
		{
			self.yOffSetConstraint.constant =  self.dataCellOrinalFrame.origin.y
			self.dataCellView.setAsCollapsed()
			self.view.layoutIfNeeded()
		}, completion: { (finished: Bool) in
			completionHandler(.success)
		})
	}
	
	func reset() {
		self.yOffSetConstraint.constant = tmpYConstant
		self.dataCellView.setAsExtended()
		self.view.layoutIfNeeded()
	}
}
