//
//  ContentView.swift
//  Learning-App
//
//  Created by John Jeang on 3/31/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model = ContentView()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
