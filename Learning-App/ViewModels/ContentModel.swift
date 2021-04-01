//
//  ContentModel.swift
//  Learning-App
//
//  Created by John Jeang on 3/31/21.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init(){
        getLocalData()
    }
    
    func getLocalData(){
        // get path
        
        // get url
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
    
        
        // get data object
        do{
            let jsonData = try Data(contentsOf: jsonURL!)
            
            let jsonDecoder = JSONDecoder()
            
            // decode data object
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
        }
        catch{
            print("Oops, there was an error trying to parse the local data")
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            print("Oops there was an error why trying to parse the style information")
        }
        
        

        

        
        
    }
    
}
