//
//  Utils.swift
//  iosproj
//
//  Created by Jacky LIM on 17/12/2020.
//

import Foundation

struct Color {
    var colors = [
        "fire": "red",
        "water": "blue",
        "poison": "purple",
        "electric": "yellow",
        "flying": "lightGray",
        "bug": "systemGreen",
        "grass": "green",
        "fighting": "gray",
        "ground": "brown",
        "fairy": "pink",
        "normal": "white",
    ]
}

func getColorForType(color: String) -> String{
    switch color {
    case "fire":
        return "red"
    default:
        return "yellow"
    }
}

extension String {
    func firstLetterToUpperCase() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func firstLetterToUpperCase() {
        self = self.firstLetterToUpperCase()
    }
}

