//
//  ContentView.swift
//  Learning-App
//
//  Created by John Jeang on 4/3/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        ScrollView{
            LazyVStack{
                if model.currentModule != nil{
                    ForEach(0..<model.currentModule!.content.lessons.count){index in
                        // Insert call to view row
                        ContentViewRow(index: index)
                    }
                    
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
        
}


