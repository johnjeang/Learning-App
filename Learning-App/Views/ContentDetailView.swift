//
//  ContentDetailView.swift
//  Learning-App
//
//  Created by John Jeang on 4/4/21.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        
        VStack{
            if url != nil{
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // TODO Description
            
            
            //Button
            if model.hasNextLesson(){
                Button(action: {model.advanceLesson()}, label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(height: 51)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
            }
            
        }
        .padding()
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
