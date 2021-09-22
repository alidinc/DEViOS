//
//  ProfileController.swift
//  DEViOS
//
//  Created by Natalie Hall on 9/21/21.
//

import Foundation
import FirebaseFirestore

class ProfileController {
    // MARK: - Shared Instance
    static let sharedProfile = ProfileController()
    
    // MARK: - SOT
    var profileItems: [Profile] = []
    
    // MARK: - Refrerence to Database
    let db = Firestore.firestore()
    
    // MARK: - CRUD
    func createProfile(for profile: Profile) {
        let profileToAdd: Profile = profile
        let profileRef = db.collection("profiles").document(profileToAdd.uid)
        profileRef.setData(["firstName" : profileToAdd.firstName,
                            "lastName" : profileToAdd.lastName,
                            "uid" : profileToAdd.uid,
                            "profilePic" : profileToAdd.profilePic ?? #imageLiteral(resourceName: "Blank-profile-pic"),
                            "city" : profileToAdd.city ?? "",
                            "state" : profileToAdd.state ?? "",
                            "country" : profileToAdd.country ?? "",
                            "bio" : profileToAdd.bio ?? "",
                            "friends" : profileToAdd.friends ?? [],
                            "linkedIn" : profileToAdd.linkedIn ?? "",
                            "gitHub" : profileToAdd.gitHub ?? "",
                            "portfolio" : profileToAdd.portfolio ?? "",
                            "otherLinks" : profileToAdd.otherLinks ?? [],
                            "learningPathsCompleted" : profileToAdd.learningPathsCompleted ?? [],
                            "codeChallengesCompleted" : profileToAdd.codeChallengesCompleted ?? [],
                            "resume" : profileToAdd.resume ?? "",
                            "twitterHandles" : profileToAdd.twitterHandles ?? [],
                            "twitterHashtags" : profileToAdd.twitterHashtags ?? []
                            ])
    }
    
    
    func fetchProfile(completion: @escaping (Bool) -> Void) {
        db.collection("profile").addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                return completion(false)
            }
            
            if let snapshot = snapshot {
                for doc in snapshot.documents {
                    let profileData = doc.data()
                    let firstName = profileData["firstName"] as? String ?? ""
                    let lastName = profileData["lastName"] as? String ?? ""
                    let uid = profileData["uid"] as? String ?? ""
                    let profilePic = profileData["profilePic"] as? UIImage ?? #imageLiteral(resourceName: "Blank-profile-pic")
                    let city = profileData["city"] as? String ?? ""
                    let state = profileData["state"] as? String ?? ""
                    let country = profileData["country"] as? String ?? ""
                    let bio = profileData["bio"] as? String ?? ""
                    let friends = profileData["friends"] as? Array ?? []
                    let linkedIn = profileData["linkedIn"] as? String ?? ""
                    let gitHub = profileData["gitHub"] as? String ?? ""
                    let portfolio = profileData["portfolio"] as? String ?? ""
                    let otherLinks = profileData["otherLinks"] as? Array ?? []
                    let learningPathsCompleted = profileData["learningPathsCompleted"] as? Array ?? []
                    let codeChallengesCompleted = profileData["codeChallengesCompleted"] as? Array ?? []
                    let resume = profileData["lastName"] as? String ?? ""
                    let twitterHandles = profileData["twitterHandles"] as? Array ?? []
                    let twitterHashtags = profileData["twitterHashtags"] as? Array ?? []
                    
                    let profile = Profile(firstName: firstName, lastName: lastName, uid: uid, profilePic: profilePic, city: city, state: state, country: country, bio: bio, friends: friends, linkedIn: linkedIn, gitHub: gitHub, portfolio: portfolio, otherLinks: otherLinks, learningPathsCompleted: learningPathsCompleted, codeChallengesCompleted: codeChallengesCompleted, resume: resume, twitterHandles: twitterHandles, twitterHashtags: twitterHashtags)
                    self.profileItems.append(profile)
                }
                completion(true)
            }
        }
    }
    
    func updateProfile(profile: Profile) {
        db.collection("profiles").document(profile.uid).setData(["firstName" : profile.firstName,
                                                                 "lastName" : profile.lastName,
                                                                 "uid" : profile.uid,
                                                                 "profilePic" : profile.profilePic ?? #imageLiteral(resourceName: "Blank-profile-pic"),
                                                                 "city" : profile.city ?? "",
                                                                 "state" : profile.state ?? "",
                                                                 "country" : profile.country ?? "",
                                                                 "bio" : profile.bio ?? "",
                                                                 "friends" : profile.friends ?? [],
                                                                 "linkedIn" : profile.linkedIn ?? "",
                                                                 "gitHub" : profile.gitHub ?? "",
                                                                 "portfolio" : profile.portfolio ?? "",
                                                                 "otherLinks" : profile.otherLinks ?? [],
                                                                 "learningPathsCompleted" : profile.learningPathsCompleted ?? [],
                                                                 "codeChallengesCompleted" : profile.codeChallengesCompleted ?? [],
                                                                 "resume" : profile.resume ?? "",
                                                                 "twitterHandles" : profile.twitterHandles ?? [],
                                                                 "twitterHashtags" : profile.twitterHashtags ?? []], merge: true)
    }
    
    
}  // End of Class
