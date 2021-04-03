//
//  ContentModel.swift
//  Learning-App
//
//  Created by John Jeang on 3/31/21.
//

import Foundation

class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    
    @Published var currentModule: Module?
    
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init(){
        getLocalData()
    }
    
    func getLocalData(){
        // get path
        
        // get url
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        if jsonURL == nil{
            print("nil URL")
        }
    
        
        // get data object
        do{
            let jsonData = try Data(contentsOf: jsonURL!)
            
            let jsonDecoder = JSONDecoder()
            
            // decode data object
            do{
                let modules = try jsonDecoder.decode([Module].self, from: jsonData)
                self.modules = modules
            }
            catch{
                print(error)
            }
            

        }
        catch{
            print("Oops, there was an error trying to make local data object")
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
    
    func setCurrentModule(_ moduleid: Int){
        for index in 0..<modules.count{
            if(moduleid == modules[index].id){
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
    
}
