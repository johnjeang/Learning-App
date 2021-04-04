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
    
    @Published var currentLesson: Lesson?
    
    var currentLessonIndex = 0
    
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
    
    func setCurrentLesson(_ lessonindex: Int){
        if lessonindex < currentModule!.content.lessons.count{
            currentLessonIndex = lessonindex
        }
        else{
            currentLessonIndex = 0
        }
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
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
    
    func hasNextLesson() -> Bool{
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    func advanceLesson(){
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count{
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else{
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
}
