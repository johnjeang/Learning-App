//
//  ContentView.swift
//  Learning-App
//
//  Created by John Jeang on 3/31/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model :ContentModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                Text("What do you want to do today")
                    .padding(.leading, 20)
                ScrollView{
                    LazyVStack{
                        ForEach(model.modules){module in
                            
                            VStack(spacing: 20){
                                NavigationLink(
                                    destination:ContentView()
                                        .onAppear(perform: {
                                            model.setCurrentModule(module.id)
                                        }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected,
                                    label:{                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description:  module.content.description, content:  "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    })
                                
                                NavigationLink(
                                    
                                    destination: TestView()
                                        .onAppear(perform: {
                                            model.beginTest(module.id)
                                        }),
                                    tag: module.id,
                                    selection: $model.currentTestSelected,
                                    label: {
                                        HomeViewRow(image: module.test.image, title: "Practice \(module.category)", description:  module.test.description, content:  "\(module.test.questions.count) Questions", time: module.test.time)
                                    }
                                
                                )
                                

                            }
                            .padding()
                            
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
