//
//  School.swift
//  NYCSchools
//
//  Created by Andrew Yahin on 5/2/21.
//

import Foundation

struct School : Identifiable, Decodable {
    let dbn: String?
    let school_name: String?
    let overview_paragraph: String?
    let phone_number: String?
    let school_email: String?
    let location: String?
    let website: String?
    let id: String = NSUUID().uuidString
}
