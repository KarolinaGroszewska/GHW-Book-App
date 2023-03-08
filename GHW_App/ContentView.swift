//
//  ContentView.swift
//  GHW_App
//
//  Created by Kari on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    let backgroundColor = Color.init(red: 0.00392, green: 0.254, blue: 0.329)
    let accentColor = Color.init(red: 0.918, green: 0.890, blue: 0.855)
    let buttonColor = Color.init(red: 0, green: 0.4, blue: 0.482)
    var body: some View {
        NavigationView{
            ZStack{
                backgroundColor
                    .ignoresSafeArea()
                VStack{
                    Text("Read at your own pace.")
                        .foregroundColor(accentColor)
                        .font(.custom("Hiragino Kaku Gothic Std", fixedSize: 22.5))
                    
                    NavigationLink("Get Started", destination: HomeView())
                        .foregroundColor(accentColor)
                        .frame(width: 232, height: 46)
                        .background(buttonColor)
                        .padding(.top, 20)
                    Image("logo")
                        .padding(.top, -15)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
