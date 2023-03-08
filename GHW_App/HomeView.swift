//
//  HomeView.swift
//  GHW_App
//
//  Created by Kari on 3/7/23.
//

import SwiftUI

struct Book : Identifiable{
    var id = UUID()
    var title: String
    var dateStarted: Date
    //pull images directly from a book API
    var cover: Image
    var currentlyReading: Bool
    var dateCompleted: Date
}

struct HomeView: View {
    let backgroundColor = Color.init(red: 0.00392, green: 0.254, blue: 0.329)
    let accentColor = Color.init(red: 0.918, green: 0.890, blue: 0.855)
    let buttonColor = Color.init(red: 0, green: 0.4, blue: 0.482)
    var body: some View {
        TabView{
            HomePrimaryView()
                .tabItem {
                    Image(systemName: "book")
                }
            ArchivePrimaryView()
                .tabItem {
                    Image(systemName: "books.vertical.fill")
                }
            SearchPrimaryView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            FavoritesPrimaryView()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                }

        }
        .onAppear(){
            UITabBar.appearance().barTintColor = UIColor(buttonColor)
        }
        .accentColor(accentColor)
    }
}

struct HomePrimaryView: View {

    
    var book1 = Book(title: "Dune", dateStarted: Date(timeIntervalSinceNow: -5), cover: Image("logo"), currentlyReading: true, dateCompleted: Date.now)
    var book2 = Book(title: "The Great Gatsby", dateStarted: Date(timeIntervalSinceNow: -12), cover: Image("logo"), currentlyReading: true, dateCompleted: Date(timeIntervalSinceNow: -8))

    
    let accentColor = Color.init(red: 0.918, green: 0.890, blue: 0.855)
    let backgroundColor = Color.init(red: 0.00392, green: 0.254, blue: 0.329)
    let buttonColor = Color.init(red: 0, green: 0.4, blue: 0.482)

    var body: some View {
        let books = [book1, book2]
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            VStack{
                HStack{
                    VStack{
                        Text("Currently Reading")
                            .foregroundColor(accentColor)
                            .font(.custom("Hiragino Kaku Gothic Std", fixedSize: 22.5))
                            .padding(.top, 5)
                        Text("As of \(Date.now.formatted(date: .abbreviated, time: .omitted))")
                            .foregroundColor(accentColor)
                            .font(.custom("Hiragino Kaku Gothic Std", fixedSize: 12))
                            .padding(.top, 5)
                        Rectangle()
                            .fill(buttonColor)
                            .frame(width: 220, height: 4)
                            .padding(.top, 8)
                    }
                }
                if books.count == 0{
                    //display there are no books + button
                }
                else{
                    ForEach(books) { book in
                        if(book.currentlyReading) {
                            VStack{
                                Image("\(book.title)")
                                HStack{
                                    Rectangle()
                                        .fill(Color.init(red: 0.627, green: 0.772, blue: 0.803))
                                        .frame(width: 4, height: 40)
                                    Text("Started \(book.dateStarted.formatted(date: .abbreviated, time: .omitted)) \nYou have had this book in your library for \(Int(book.dateCompleted.timeIntervalSinceReferenceDate - book.dateStarted.timeIntervalSinceReferenceDate)) days.")
                                        .foregroundColor(accentColor)
                                        .font(.custom("Hiragino Kaku Gothic Std", fixedSize: 10))
                                }
                                .frame(width: 150)
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct ArchivePrimaryView: View {
    let accentColor = Color.init(red: 0.918, green: 0.890, blue: 0.855)
    let backgroundColor = Color.init(red: 0.00392, green: 0.254, blue: 0.329)
    var body: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            VStack{
                Text("Reading Archive")
                    .foregroundColor(accentColor)
                    .font(.custom("Hiragino Kaku Gothic Std", fixedSize: 22.5))
            }
        }
    }
}

struct SearchPrimaryView: View {
    let accentColor = Color.init(red: 0.918, green: 0.890, blue: 0.855)
    let backgroundColor = Color.init(red: 0.00392, green: 0.254, blue: 0.329)
    var body: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            VStack{
                Text("Search")
                    .foregroundColor(accentColor)
                    .font(.custom("Hiragino Kaku Gothic Std", fixedSize: 22.5))
            }
        }
    }
}

struct FavoritesPrimaryView: View {
    let accentColor = Color.init(red: 0.918, green: 0.890, blue: 0.855)
    let backgroundColor = Color.init(red: 0.00392, green: 0.254, blue: 0.329)
    var body: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea()
            VStack{
                Text("My Favorites")
                    .foregroundColor(accentColor)
                    .font(.custom("Hiragino Kaku Gothic Std", fixedSize: 22.5))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
