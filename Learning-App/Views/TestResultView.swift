//
//  TestResultView.swift
//  Learning-App
//
//  Created by John Jeang on 4/6/21.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    var numCorrect: Int
    var resultHeading: String {
        
        guard model.currentModule != nil else{
            return ""
        }
        
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        if pct > 0.6{
            return "Doing Great!"
        }
        else if pct > 0.3{
            return "Doing ok..."
        }
        else{
            return "Keep trying!"
        }
    }
    
    var body: some View {
        
        VStack{
            Spacer()
            Text(resultHeading)
            Spacer()
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) correct")
            Spacer()
            Button{
                model.currentTestSelected = nil
            } label:{
                ZStack{
                    RectangleCard(color: Color.green)
                        .frame(height: 51)
                    Text("Complete")
                        .foregroundColor(Color.white)
                }
                .padding()
            }
            Spacer()
            
        }
    }
}
