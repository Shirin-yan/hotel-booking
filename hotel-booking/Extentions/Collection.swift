//
//  Collection.swift
//  hotel-booking
//
//  Created by Shirin on 21.12.2023.
//

import Foundation

extension Collection {
    func enumeratedArray() -> Array<(offset: Int, element: Self.Element)> {
        return Array(self.enumerated())
    }
}
