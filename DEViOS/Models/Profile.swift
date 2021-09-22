//
//  Profile.swift
//  DEViOS
//
//  Created by Natalie Hall on 9/21/21.
//

import UIKit

class Profile {
    var firstName: String
    var lastName: String
    var uid: String
    var profilePic: UIImage?
    var city: String?
    var state: String?
    var country: String?
    var bio: String?
    var friends: Array<Any>?
    var linkedIn: String?
    var gitHub: String?
    var portfolio: String?
    var otherLinks: Array<Any>?
    var learningPathsCompleted: Array<Any>?
    var codeChallengesCompleted: Array<Any>?
    var resume: String?  //should be a document, but not sure how to do that
    var twitterHandles: Array<Any>?
    var twitterHashtags: Array<Any>?
    
    init(firstName: String, lastName: String, uid: String = UUID().uuidString, profilePic: UIImage?, city: String?, state: String?, country: String?, bio: String?, friends: Array<Any>?, linkedIn: String?, gitHub: String?, portfolio: String?, otherLinks: Array<Any>?, learningPathsCompleted: Array<Any>?, codeChallengesCompleted: Array<Any>?, resume: String?, twitterHandles: Array<Any>?, twitterHashtags: Array<Any>?) {
        self.firstName = firstName
        self.lastName = lastName
        self.uid = uid
        self.profilePic = profilePic
        self.city = city
        self.state = state
        self.country = country
        self.bio = bio
        self.friends = friends
        self.linkedIn = linkedIn
        self.gitHub = gitHub
        self.portfolio = portfolio
        self.otherLinks = otherLinks
        self.learningPathsCompleted = learningPathsCompleted
        self.codeChallengesCompleted = codeChallengesCompleted
        self.twitterHandles = twitterHandles
        self.twitterHashtags = twitterHashtags
    }
    
}  // End of Class
