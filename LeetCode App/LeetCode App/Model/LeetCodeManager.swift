//
//  LeetCodeManager.swift
//  LeetCode App
//
//  Created by Shaik Ismail on 01/09/24.
//

import Foundation

protocol LeetCodeDelegate
{
    func updateUI(leetcode:LeetCodeModel)
}
struct LeetCodeManager
{
    var delegate:LeetCodeDelegate?
    let baseURL="https://alfa-leetcode-api.onrender.com/userProfile"
    
    func getUsername(username:String)
    {
        let modifiedURL="\(baseURL)/\(username)"
        fetchData(url: modifiedURL)
        
    }
    
    func fetchData(url:String)
    {
        //create a url
        if let url=URL(string: url)
        {
            //create a url session
            let urlSession=URLSession(configuration: .default)
            
            //create a session task
            
            let task=urlSession.dataTask(with: url, completionHandler: handle(data:urlresponse:error:))
            
            task.resume()
            
        }
    }
    
    func handle(data:Data?,urlresponse:URLResponse?,error:Error?)->Void
    {
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData=data
        {
            if let model=parseJSON(data: safeData)
            {
                delegate?.updateUI(leetcode: model)
            }
        }
    }
    
    func parseJSON(data:Data)->LeetCodeModel?
    {
        let decoder=JSONDecoder()
        do{
            let decodedData=try decoder.decode(LeetCodeDataFormat.self, from: data)
            let totalsolved=decodedData.totalSolved
            let easysolved = decodedData.easySolved
            let mediumsolved=decodedData.mediumSolved
            let hardsolved=decodedData.hardSolved
            let ranking = decodedData.ranking
            
            let leetcodemodel=LeetCodeModel(totalSolved: totalsolved, easySolved: easysolved, mediumSolved: mediumsolved, hardSolved: hardsolved, ranking: ranking)
            return leetcodemodel
        }catch{
            print(error)
            return nil
        }
       
    }
}
    
