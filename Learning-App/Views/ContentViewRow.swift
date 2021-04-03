//
//  ContentViewRow.swift
//  Learning-App
//
//  Created by John Jeang on 4/3/21.
//

import SwiftUI



struct ContentViewRow: View {
    @EnvironmentObject var model: ContentModel
    var index: Int
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        ZStack(alignment:.leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height:86)
            HStack{
                Text(String(index + 1))
                    .bold()
                    .padding(.trailing, 10)
                VStack(alignment: .leading, spacing: 5){
                    Text(lesson.title)
                        .bold()
                        .font(Font.system(size: 14))
                    Text(lesson.duration)
                        .font(Font.system(size: 10))
                }
            }
            .padding()
        }
        .padding(.bottom, 3)
    }
}
