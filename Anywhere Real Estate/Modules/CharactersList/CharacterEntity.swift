//
//  CharacterEntity.swift
//  Anywhere Real Estate
//
//  Created by Brandon Shaw on 4/23/23.
//

import UIKit

struct Character: Codable {
	let id: Int
	let name, normalizedName: String
	let gender: Gender
	
	enum CodingKeys: String, CodingKey {
		case id, name
		case normalizedName = "normalized_name"
		case gender
	}
}

enum Gender: String, Codable {
	case edBegleyJr = "ed begley jr"
	case empty = ""
	case f = "f"
	case homerMargeAndBart = "homer marge and bart"
	case hulkingShamblingFigure = "hulking shambling figure"
	case kearneyJr = "kearney jr"
	case m = "m"
	case martinPrinceSr = "martin prince sr"
	case nedwardFlandersSr = "nedward flanders sr"
	case rayJayJohnsonJr = "ray jay johnson jr"
	case rogerMeyersJr = "roger meyers jr"
	case the5 = "& #5'"
	case waylonSmithersSr = "waylon smithers sr"
}
