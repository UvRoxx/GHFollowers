//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by UTKARSH VARMA on 2021-01-03.
//

import UIKit

class NetworkManager{
    static let shared = NetworkManager()
    private init (){ }
    let siteUrl = "https://api.github.com/users/"
    
    func getData(_ UserName:String,atPage page:Int,completed: @escaping(Result<[Follower],GFError>)->Void){
        
        let endpoint =  "\(siteUrl)\(UserName)/followers?per_page=100&page=\(page)#"
        guard let url = URL(string: endpoint)else{
            completed(.failure(.invalidUsername))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else{
                completed(.failure(.unableToComplete))
                return
            }
            if let safeData = data{
                print("Data fetched")
                print(safeData)
                print(url)
                if let decodedFollowers = self.decodeJSON(safeData){
                    completed(.success(decodedFollowers))
                    
                }else{
                    completed(.failure(.invalidData))
                }
            }else{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    
    func decodeJSON(_ data:Data)->[Follower]?{
        let decoder = JSONDecoder()
        do{
            print("Success")
            let followersdata = try decoder.decode([Follower].self, from: data)
            return followersdata
            
        }catch{
            return nil
        }
    }
}
