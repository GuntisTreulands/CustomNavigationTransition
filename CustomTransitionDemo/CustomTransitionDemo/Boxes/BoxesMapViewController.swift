//
//  BoxesMapViewController.swift
//  CustomTransitionDemo
//
//  Created by Guntis on 26/06/2019.
//  Copyright © 2019 . All rights reserved.
//

import UIKit
import MapKit

class BoxesMapViewController: UIViewController, PushTransitionAnimatorHelperProtocol, PopTransitionAnimatorHelperProtocol {
	
	@IBOutlet var mapView: MKMapView!
	@IBOutlet var box: UIView!
	
	@IBOutlet var widthConstraint: NSLayoutConstraint!
	@IBOutlet var heightConstraint: NSLayoutConstraint!
	@IBOutlet var yConstraint: NSLayoutConstraint!
	
	var originalBoxRect: CGRect!
	var tmpHeightConstant: CGFloat!
	
	// MARK: View loading 
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Boxes map"
		mapView.alpha = 0
    }

	// MARK: PushTransitionAnimatorHelperProtocol

	func reveal(withDuration duration: TimeInterval, completionHandler: @escaping ((TransitionResult<Bool>) -> Void)) {
		self.yConstraint.constant = originalBoxRect.origin.y-self.view.safeAreaInsets.top
		self.widthConstraint.constant = originalBoxRect.width
		self.heightConstraint.constant = originalBoxRect.height
		self.view.layoutIfNeeded()

		UIView.animate(withDuration: duration/2) {
			self.mapView.alpha = 1
			self.view.layoutIfNeeded()
		}

		UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: [.curveEaseInOut], animations:
		{
			self.yConstraint.constant =  self.view.frame.height-self.box.frame.height - self.view.safeAreaInsets.top
			self.widthConstraint.constant = self.view.frame.width-32
			self.heightConstraint.constant = 200
			self.box.layer.cornerRadius = 20
			self.view.layoutIfNeeded()
		}, completion: { (finished: Bool) in
			completionHandler(.success)
		})
  	}

  	// MARK: PopTransitionAnimatorHelperProtocol

  	func hide(withDuration duration: TimeInterval, completionHandler: @escaping ((TransitionResult<Bool>) -> Void)) {
  		tmpHeightConstant = self.yConstraint.constant

		UIView.animate(withDuration: duration/2) {
			self.mapView.alpha = 0
			self.view.layoutIfNeeded()
		}
		
  		UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: [.curveEaseInOut], animations:
  		{
			self.yConstraint.constant =  self.originalBoxRect.origin.y-self.view.safeAreaInsets.top
			self.widthConstraint.constant = self.originalBoxRect.width
			self.heightConstraint.constant = self.originalBoxRect.height
			self.box.layer.cornerRadius = 0
			self.view.layoutIfNeeded()
		}, completion: { (finished: Bool) in
			completionHandler(.success)
		})
	}

	func reset() {
		self.yConstraint.constant =  tmpHeightConstant
		self.widthConstraint.constant = self.view.frame.width-32
		self.heightConstraint.constant = 200
	}
}
