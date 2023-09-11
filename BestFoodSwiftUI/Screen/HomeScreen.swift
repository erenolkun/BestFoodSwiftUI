//
//  HomeScreen.swift
//  BestFoodSwiftUI
//
//  Created by FERDA OLKUN on 1.09.2023.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedindex: Int = 0
    
    private let categories = ["All","Burger","Döner","Kebap","Köfte","Çorba"]
    var body: some View {
        NavigationView {
            ZStack{
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                    
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        AppBarView()
                            
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView (.horizontal,showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categories.count) { i in
                                    CategoryView(isActive: i == selectedindex, text: categories[i])
                                        .onTapGesture {
                                            selectedindex = i
                                        }
                                }
                                
                            }.padding()
                        }
                        Text("Popular")
                            .font(.custom("Playfairdisplay-Bold", size: 24))
                            .padding(.horizontal)
                            
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<4) { index in
                                    NavigationLink(destination: DetailScreen(), label:{ ProductCardView(image: Image("yemek_\(index+1)"),size: 210)
                                    })
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Best")
                            .font(.custom("Playfairdisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<4) { index in
                                    ProductCardView(image: Image("yemek_\(index+1)"),size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        
                        
                    }
                }

    //         Custom Bottom NavBar
                HStack{
                    ButtomNavBarItem(image: Image("home")) {}
                    ButtomNavBarItem(image: Image("fav")) {}
                    ButtomNavBarItem(image: Image("shop")) {}
                    ButtomNavBarItem(image: Image("user")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x:2, y:6)
                .frame(maxHeight: . infinity, alignment: .bottom)
                
                
             
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action:{}){
                Image("menu")
                    .background(Color.white)
                    .padding()
                    .cornerRadius(10.0)
            }
            Spacer()
            
            Button (action:{}){
                Image("profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Food!")
            .font(.custom("PlayfairDisplay-MediumItalic", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack {
                Image("search")
                    .padding(.trailing, 8)
                TextField("Search Food", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action:{}){
                Image("scan")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size:18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"):Color.black.opacity(0.5))
            
            
            if(isActive) {
                Color("Pirmary")
                    .frame(width:15, height: 2)
                    .clipShape(Capsule())
            }
        }.padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text("Lux Burger")
                .font(.title3)
                .fontWeight(.bold)
            HStack (spacing:2){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                    
                    
                }
                Spacer()
                
                Text("5$")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct ButtomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            image
            .frame(maxWidth: .infinity) })
    }
}

