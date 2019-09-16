//
//  ForestModel.swift
//  CustomTransitionDemo
//
//  Created by Guntis on 03/09/2019.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

struct Forest: Codable {
	var bigImageName: String
	var smallImageName: String
	var name: String
	var description: String
	var expandedDescription: String
	
	static func getAllForests() -> [Forest] {
		return [
			Forest.init(bigImageName: "icon_1_big", smallImageName: "icon_1", name: "Big creak forest", description: "This forest is well know for it's big trees and wild animals.", expandedDescription: "Wednesday is hump day, but has anyone asked the camel if he’s happy about it?"),
			Forest.init(bigImageName: "icon_2_big", smallImageName: "icon_2", name: "Broad chestnut Woodland", description: "Writing a list of random sentences is harder than I initially thought it would be.", expandedDescription: "I currently have 4 windows open up… and I don’t know why."),
			Forest.init(bigImageName: "icon_3_big", smallImageName: "icon_3", name: "Greasy Fir thicket", description: "This is the last random sentence I will be writing and I am going to stop mid-sent", expandedDescription: "It was getting dark, and we weren’t there yet."),
			Forest.init(bigImageName: "icon_4_big", smallImageName: "icon_4", name: "Spiritual Grove", description: "The old apple revels in its authority.", expandedDescription: "The book is in front of the table."),
			Forest.init(bigImageName: "icon_5_big", smallImageName: "icon_5", name: "Lesser Jaguar Grove", description: "Two seats were vacant.", expandedDescription: "She advised him to come back at once."),
			Forest.init(bigImageName: "icon_6_big", smallImageName: "icon_6", name: "Royal Pygmy Owl Grove", description: "Sometimes, all you need to do is completely make an ass of yourself and laugh it off to realise that life isn’t so bad after all.", expandedDescription: "I'd rather be a bird than a fish."),
			Forest.init(bigImageName: "icon_7_big", smallImageName: "icon_7", name: "Eastminster Timberland", description: "Tom got a small piece of pie.", expandedDescription: "We need to rent a room for our party."),
			Forest.init(bigImageName: "icon_8_big", smallImageName: "icon_8", name: "Stoneisle Thicket", description: "The lake is a long way from here.", expandedDescription: "I will never be this young again. Ever. Oh damn… I just got older."),
			Forest.init(bigImageName: "icon_9_big", smallImageName: "icon_9", name: "Coromis Thicket", description: "A purple pig and a green donkey flew a kite in the middle of the night and ended up sunburnt.", expandedDescription: "She only paints with bold colors; she does not like pastels."),
			Forest.init(bigImageName: "icon_10_big", smallImageName: "icon_10", name: "Bignia Covert", description: "Rock music approaches at high velocity.", expandedDescription: "She wrote him a long letter, but he didn't read it."),
			]
	}
}

