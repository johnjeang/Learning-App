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
    
    @Published var currentQuestion: Question?
    
    @Published var codeText = NSAttributedString()
    
    @Published var currentContentSelected:Int?
    
    @Published var currentTestSelected:Int?
    
    var currentLessonIndex = 0
    
    var currentModuleIndex = 0
    
    var currentQuestionIndex = 0
    
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
        codeText = addStyling(currentLesson!.explanation)
        
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
    
    func beginTest(_ moduleid: Int){
        // set module
        setCurrentModule(moduleid)
        
        // set question
        if currentModule?.test.questions.count ?? 0 > 0{
            currentQuestionIndex = 0
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
            codeText = addStyling(currentQuestion!.content)
        }
    }
    
    func hasNextLesson() -> Bool{
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    
    func advanceLesson(){
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count{
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            codeText = addStyling(currentLesson!.explanation)
        }
        else{
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
    private func addStyling(_ htmlString: String) -> NSAttributedString{
        var resultString = NSAttributedString()
        var data = Data()
        
        // Add style data first
        if styleData != nil{
            data.append(self.styleData!)
        }
        
        // Add html data next
        data.append(Data(htmlString.utf8))
        
        // convert to attributed string
        
    
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil){
            resultString = attributedString
        }
        return resultString
    }
    
}
