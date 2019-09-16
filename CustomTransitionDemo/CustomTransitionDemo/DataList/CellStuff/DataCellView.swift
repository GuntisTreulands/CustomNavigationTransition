//
//  DataCellView.swift
//  CustomTransitionDemo
//
//  Created by Guntis on 03/09/2019.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

enum CellBackgroundType: Int {
	case top = 0
	case middle = 1
	case bottom = 2
	case single = 3
}

class DataCellView: UIView {

	var cellType: CellBackgroundType?
	
	@IBOutlet var baseView: UIView!
	@IBOutlet var bgImageView: UIImageView!
	@IBOutlet var iconImageView: UIImageView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var descriptionLabel: UILabel!
	@IBOutlet var accessoryIconImageView: UIImageView!
	@IBOutlet var separatorView: UIView!
	
	var bgViewBottomAnchorConstraint: NSLayoutConstraint?
	var bgViewTopAnchorConstraint: NSLayoutConstraint?
	
	var iconImageViewLeftConstraint: NSLayoutConstraint?
	var iconImageViewTopConstraint: NSLayoutConstraint?
	var iconImageViewWidthConstraint: NSLayoutConstraint?
	var iconImageViewHeightConstraint: NSLayoutConstraint?
	var iconImageViewBottomConstraint: NSLayoutConstraint?
	
	var iconImageViewCenterXConstraint: NSLayoutConstraint?

	var descriptionBottomConstraint: NSLayoutConstraint?
	
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
		Bundle.main.loadNibNamed("DataCellView", owner: self, options: nil)
		addSubview(baseView)
		baseView.frame = self.bounds
		self.clipsToBounds = true
		
		self.translatesAutoresizingMaskIntoConstraints = false
		bgImageView.translatesAutoresizingMaskIntoConstraints = false
		iconImageView.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
		accessoryIconImageView.translatesAutoresizingMaskIntoConstraints = false
		separatorView.translatesAutoresizingMaskIntoConstraints = false
		baseView.translatesAutoresizingMaskIntoConstraints = false
		
		
        baseView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
       	baseView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
       	baseView.backgroundColor = .clear
       	
		bgImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
		bgImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
		bgViewBottomAnchorConstraint = bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
		bgViewBottomAnchorConstraint?.isActive = true
		bgViewTopAnchorConstraint = bgImageView.topAnchor.constraint(equalTo: topAnchor)
		bgViewTopAnchorConstraint?.isActive = true

		iconImageViewLeftConstraint = iconImageView.leftAnchor.constraint(equalTo: bgImageView.leftAnchor, constant: 10)
		iconImageViewTopConstraint = iconImageView.topAnchor.constraint(equalTo: bgImageView.topAnchor, constant: 11)
		iconImageViewWidthConstraint = iconImageView.widthAnchor.constraint(equalToConstant: 33)
		iconImageViewHeightConstraint = iconImageView.heightAnchor.constraint(equalToConstant: 33)
		iconImageViewCenterXConstraint = iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
		iconImageViewBottomConstraint = iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
		
		iconImageViewLeftConstraint?.isActive = true
		iconImageViewHeightConstraint?.isActive = true
		iconImageViewWidthConstraint?.isActive = true
		iconImageViewTopConstraint?.isActive = true
		
		titleLabel.leftAnchor.constraint(equalTo: bgImageView.leftAnchor, constant: 53).isActive = true
		titleLabel.topAnchor.constraint(equalTo: bgImageView.topAnchor, constant: 6).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: accessoryIconImageView.leftAnchor, constant: -10).isActive = true
//		titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.height).isActive = true
//titleLabel.backgroundColor = .red
		descriptionLabel.leftAnchor.constraint(equalTo: bgImageView.leftAnchor, constant: 53).isActive = true
		descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
		descriptionBottomConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: -9)
		descriptionBottomConstraint?.isActive = true
		descriptionLabel.rightAnchor.constraint(equalTo: accessoryIconImageView.leftAnchor, constant: -10).isActive = true

		accessoryIconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true		
		accessoryIconImageView.rightAnchor.constraint(equalTo: bgImageView.rightAnchor, constant: -10).isActive = true
		accessoryIconImageView.topAnchor.constraint(equalTo: bgImageView.topAnchor).isActive = true
		accessoryIconImageView.bottomAnchor.constraint(equalTo: bgImageView.bottomAnchor).isActive = true

				
		separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
		separatorView.topAnchor.constraint(equalTo: bgImageView.bottomAnchor, constant: -1).isActive = true
		separatorView.rightAnchor.constraint(equalTo: bgImageView.rightAnchor).isActive = true
		separatorView.leftAnchor.constraint(equalTo: bgImageView.leftAnchor).isActive = true
  	}
  	
  	// MARK: Functions
  	
  	func setAsCellType(cellType: CellBackgroundType) {
		switch cellType {
			case .top:
				self.bgViewTopAnchorConstraint?.constant = 16
				self.bgViewBottomAnchorConstraint?.constant = 0
				self.separatorView.isHidden = false
				bgImageView.image = UIImage.init(named: "cell_bg_top")
			case .bottom:
				self.bgViewTopAnchorConstraint?.constant = 0
				self.bgViewBottomAnchorConstraint?.constant = -16
				self.separatorView.isHidden = true
				bgImageView.image = UIImage.init(named: "cell_bg_bottom")
			case .middle:
				self.bgViewTopAnchorConstraint?.constant = 0
				self.bgViewBottomAnchorConstraint?.constant = 0
				self.separatorView.isHidden = false
				bgImageView.image = UIImage.init(named: "cell_bg_middle")
			case .single:
				self.bgViewTopAnchorConstraint?.constant = 16
				self.bgViewBottomAnchorConstraint?.constant = -16
				self.separatorView.isHidden = true
				bgImageView.image = UIImage.init(named: "cell_bg_single")
		}
	}
	
	func setAsExtended() {
		bgImageView.alpha = 0
		titleLabel.alpha = 0
		descriptionLabel.alpha = 0
		separatorView.alpha = 0
		accessoryIconImageView.alpha = 0
		iconImageViewLeftConstraint?.isActive = false
		descriptionBottomConstraint?.isActive = false
		iconImageViewCenterXConstraint?.isActive = true
		iconImageViewBottomConstraint?.isActive = true
		iconImageViewWidthConstraint?.constant = 100
		iconImageViewHeightConstraint?.constant = 100
		bgViewTopAnchorConstraint?.constant = 0
		iconImageView.layer.cornerRadius = 10
	}
	
	func setAsCollapsed() {
		bgImageView.alpha = 1
		titleLabel.alpha = 1
		descriptionLabel.alpha = 1
		separatorView.alpha = 1
		accessoryIconImageView.alpha = 1
		iconImageViewCenterXConstraint?.isActive = false
		iconImageViewBottomConstraint?.isActive = false
		descriptionBottomConstraint?.isActive = true
		iconImageViewLeftConstraint?.isActive = true
		iconImageViewWidthConstraint?.constant = 33
		iconImageViewHeightConstraint?.constant = 33
		iconImageView.layer.cornerRadius = 0
		
		if let cellType = self.cellType {
			setAsCellType(cellType: cellType)
		}
	}
	
	func updateData(fromModel model: Forest, andCellType cellType: CellBackgroundType) {
		titleLabel.text = model.name
		descriptionLabel.text = model.description
		iconImageView.image = UIImage.init(named: model.bigImageName)
		self.cellType = cellType
		setAsCellType(cellType: cellType)
	}
}
