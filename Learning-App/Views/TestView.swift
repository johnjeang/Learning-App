//
//  TestView.swift
//  Learning-App
//
//  Created by John Jeang on 4/5/21.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
    @State var submitted = false
    @State var numCorrect = 0
    
    var body: some View {
        
        if model.currentQuestion != nil{
            VStack{
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                
                // Question
                CodeTextView()
                    .padding(.leading, 20)
                
                // Answer
                ScrollView{
                    VStack{
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self){index in
                            Button{
                                //action
                                selectedAnswerIndex = index
                            } label: {
                                ZStack {
                                    if !submitted{
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 51)
                                    }
                                    else if index == model.currentQuestion!.correctIndex{
                                        RectangleCard(color: Color.green)
                                            .frame(height: 51)
                                            .foregroundColor(.white)
                                    }
                                    else if (index == selectedAnswerIndex){
                                        RectangleCard(color: Color.red)
                                            .frame(height: 51)
                                            .foregroundColor(.white)
                                    }
                                    else{
                                        RectangleCard(color: Color.white)
                                            .frame(height: 51)
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }
                            }
                            .disabled(submitted)
                            
                        }
                        
                    }
                    .padding()
                    .accentColor(.black)
                }
                
                Button{
                    //action
                    if submitted == true{
                        model.advanceQuestion()
                        selectedAnswerIndex = nil
                        submitted = false
                    }
                    
                    else{
                        submitted = true
                        if (selectedAnswerIndex == model.currentQuestion!.correctIndex){
                            numCorrect += 1
                        }
                    }

                } label:{
                    ZStack{
                        RectangleCard(color: Color.green)
                            .frame(height: 51)
                        Text(buttonText)
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                }
                .disabled(selectedAnswerIndex == nil)

                
                // Confirm Answer
                
                
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
        
        
    }
    
    var buttonText: String{
        if submitted{
            if model.currentModule!.test.questions.count == model.currentQuestionIndex + 1 {
                return "Finish"
            }
            else{
                return "Next Question"
            }

        }
        else{
            return "Submit"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
