//
//  VKAPIService.swift
//  SwiftUIVK
//


import Foundation
import Alamofire

class VKAPIService {
    
    private let baseUrl = "https://api.vk.com/"
    private var token = SessionSingletone.shared.token
    private var userID = SessionSingletone.shared.userID
    private var version = "5.131"
    
    func friendsListRequest() {
        let friendsGetUrl = baseUrl + "method/friends.get"
        let parameters: Parameters = [
            "user_id": userID,
            "fields": "photo_50",
            "access_token": token,
            "v": version
        ]
        
        AF.request(friendsGetUrl, method: .get, parameters: parameters).responseData { response in
            
            let jsonDecoder = JSONDecoder()
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let friends = try jsonDecoder.decode(FriendsList.self, from: data)
                      SessionSingletone.shared.friends = friends.response.items
                    } catch let error {
                        print(error.localizedDescription)
                        
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
     func groupsListRequest() {
        
        let groupsGetUrl = baseUrl + "method/groups.get"
        let parameters: Parameters = [
            "user_id": userID,
            "extended": "1",
            "fields": "description",
            "access_token": token,
            "v": version
        ]
        
        AF.request(groupsGetUrl, method: .get, parameters: parameters).responseData { response in
            
            let jsonDecoder = JSONDecoder()
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let groups = try jsonDecoder.decode(GroupsList.self, from: data)
                        SessionSingletone.shared.groups = groups.response.items
                    } catch let error {
                        print(error.localizedDescription)

                    }
                }

            case .failure(let error):
                print(error)

            }
        }
    }
    
     func photosCollectionRequest() {
         
        let photosGetUrl = baseUrl + "method/photos.get"
        let parameters: Parameters = [
            "user_id": userID,
            "album_id": "wall",
            "photo_sizes": "1",
            "access_token": token,
            "v": version
        ]
        
        AF.request(photosGetUrl, method: .get, parameters: parameters).responseData { response in
            
            let jsonDecoder = JSONDecoder()
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let photos = try jsonDecoder.decode(PhotosCollection.self, from: data)
                        let photosItems = photos.response.items
                        for photo in photosItems {
                            SessionSingletone.shared.photos.append(photo.urls.first!)
                        }
                    } catch let error {
                        print(error.localizedDescription)
                        
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
     func newsFeedRequest() {
        let newsGetUrl = baseUrl + "method/newsfeed.get"
        let parameters: Parameters = [
            "user_id": userID,
            "count": "30",
            "access_token": token,
            "v": version
        ]
        
        AF.request(newsGetUrl, method: .get, parameters: parameters).responseData { response in
            
            let jsonDecoder = JSONDecoder()
            
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let news = try jsonDecoder.decode(NewsList.self, from: data)
                        SessionSingletone.shared.news = news.response.items
                    } catch let error {
                        print(error.localizedDescription)
                        
                    }
                }
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
