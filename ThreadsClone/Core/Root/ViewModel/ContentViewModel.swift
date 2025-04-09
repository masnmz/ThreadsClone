//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 09/04/2025.
//
import FirebaseAuth
import Foundation
import Observation

@Observable
class ContentViewModel {
    var userSession: FirebaseAuth.User? {
        AuthService.shared.userSession
    }
}



