//
//  Note.swift
//  Notes
//
//  Created by Arul on 22/01/25.
//
import Foundation

struct Note : Decodable, Identifiable{
    let id : UUID
    let notes :String
    
}
