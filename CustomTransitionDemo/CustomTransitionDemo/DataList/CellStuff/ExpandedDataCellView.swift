//
//  ExpandedDataCellView.swift
//  CustomTransitionDemo
//
//  Created by Guntis on 03/09/2019.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

class ExpandedDataCellView: UIView {

	@IBOutlet var baseView: UIView!
	@IBOutlet var bgImageView: UIImageView!
	@IBOutlet var dataCellView: DataCellView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var descriptionLabel: UILabel!
	
	var bgViewTopAnchorConstraint: NSLayoutConstraint?
	
	var descriptionBottomConstraint: NSLayoutConstraint?
	
	var titleTopDataCellViewConstraint: NSLayoutConstraint?
	var titleTopViewViewConstraint: NSLayoutConstraint?

	// Forward this from viewController, so that we can extend white bg on the bottom
	var safeLayoutBottomInset: CGFloat = 0 {
		didSet {
			self.descriptionBottomConstraint?.constant = -10 - safeLayoutBottomInset
		}
	}

	// MARK: View lifecycle

	override init(frame: CGRect) {
   	super.init(frame: frame)
		setup()
  	}

  	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
    	setup()
	}

	func setup() {
		Bundle.main.loadNibNamed("ExpandedDataCellView", owner: self, options: nil)
		addSubview(baseView)
		baseView.frame = self.bounds
		
		self.translatesAutoresizingMaskIntoConstraints = false
		bgImageView.translatesAutoresizingMaskIntoConstraints = false
		dataCellView.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		baseView.translatesAutoresizingMaskIntoConstraints = false

		
		bgImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
		bgImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
		bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		bgViewTopAnchorConstraint = bgImageView.topAnchor.constraint(equalTo: topAnchor, constant: 30)
		bgViewTopAnchorConstraint?.isActive = true
		
		
        baseView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
       	baseView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
       	
    	
    	dataCellView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		dataCellView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		dataCellView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

		titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
		titleTopDataCellViewConstraint = titleLabel.topAnchor.constraint(equalTo: dataCellView.bottomAnchor, constant: 6)
		titleTopViewViewConstraint = titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6)
		titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true

		descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
		descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
		descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true

		descriptionBottomConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)

		setAsCollapsed()
  	}
  	
  	
  	func updateData(fromModel model: Forest, andCellType cellType: CellBackgroundType) {
		titleLabel.text = model.name
		descriptionLabel.text = "\(model.description)\n\n\(model.expandedDescription)"
		dataCellView.updateData(fromModel: model, andCellType: cellType)
	}
	
	func setAsExtended() {
		dataCellView.setAsExtended()
		bgImageView.alpha = 1
		titleLabel.alpha = 1
		descriptionLabel.alpha = 1
		bgViewTopAnchorConstraint?.constant = 30
		titleTopViewViewConstraint?.isActive = false
		titleTopDataCellViewConstraint?.isActive = true
		descriptionBottomConstraint?.isActive = true
	}
	
	func setAsCollapsed() {
		dataCellView.setAsCollapsed()
		bgImageView.alpha = 0
		titleLabel.alpha = 0
		descriptionLabel.alpha = 0
		bgViewTopAnchorConstraint?.constant = 0
		descriptionBottomConstraint?.isActive = false
		titleTopDataCellViewConstraint?.isActive = false
		titleTopViewViewConstraint?.isActive = true
	}
}
