//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Mehmet Alp Sönmez on 05/04/2025.
//

import Foundation


enum ProfileThreadFilter: Int, Identifiable, CaseIterable {
    case threads
    case replies
//    case likes
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
//        case .likes: return "Likes"
        }
    }
    
    var id: Int { return self.rawValue}
}
