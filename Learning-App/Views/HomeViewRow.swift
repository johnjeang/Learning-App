//
//  HomeViewRow.swift
//  Learning-App
//
//  Created by John Jeang on 4/1/21.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var content: String
    var time: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
            
                Spacer()
                
                VStack (alignment: .leading, spacing: 10){
                    Text(title)
                        .bold()
                    Text(description)
                        .padding(.bottom, 20)
                        .font(Font.system(size: 12))
                    
                    HStack{
                        Image(systemName: "text.book.closed")
                            .frame(width: 15, height: 15)
                        Text(content)
                            .font(Font.system(size: 10))
                        Image(systemName: "clock")
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                    .font(Font.system(size: 10))
                    // Change font here
                    
                }
            }
            .foregroundColor(.black)
            .padding(.horizontal, 10)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "filler description here, with some dummy text", content: "20 Lessons", time: "3 Hours")
            .previewDevice("iPhone 11")
    }
}
