//
//  YSTouchEvent.swift
//  sumi
//
//  Created by Yuji Sasaki on 2020/03/08.
//  Copyright © 2020 Yuji Sasaki. All rights reserved.
//

import Foundation

struct TouchEvent: Codable {
    let time: Int
    let touches: [Touch]
}

struct Touch: Codable {
    let identifier: Int
    let screen: Point
    let page: Point
    let client: Point
}

struct Point: Codable {
    let x: Int
    let y: Int
}
