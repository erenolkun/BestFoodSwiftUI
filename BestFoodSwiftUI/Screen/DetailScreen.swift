//
//  DetailScreen.swift
//  BestFoodSwiftUI
//
//  Created by FERDA OLKUN on 2.09.2023.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Image("yemek_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                   
                
                VStack(alignment: .leading){
                    Text("Lux Burger")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack(spacing:4) {
                        ForEach(0 ..< 5) { item in
                            Image("star")
                        }
                        Text("(4.9)")
                            .opacity(0.5)
                            .padding(.leading, 8)
                        Spacer()
                        
                    }
                    Text("Description")
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                    Text("With new found success with their beef sandwich, they named it the hamburger after the Erie County Fair's home town of Hamburg, New York")
                        .lineSpacing(8.0)
                        .opacity(0.6)
                    
                    HStack(alignment: .top){
                        VStack(alignment: . leading ){
                            Text("Size")
                                .fontWeight(.semibold)
                                .padding(.bottom,4)
                            Text("Small")
                            Text("Medium")
                            Text("Large")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading){
                            Text("Contents")
                                .padding(.bottom,4)
                                .fontWeight(.semibold)
                            
                            Text("Beef,Burger,Cheddar Cheese")
                                .opacity(0.6)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical)
                    
                }
                .padding()
                .background(Color("Bg"))
                .cornerRadius(40.0)
                .offset(y: -40)
                .padding(.top)
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack{
                Text("$5")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Button(action:{}, label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10.0)
                    
                    
                })
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .frame(maxHeight:.infinity, alignment: .bottom)
            .foregroundColor(Color("Primary"))
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButtonView(action:{presentationMode.wrappedValue.dismiss()}), trailing: Image("threedot").background(Color.white).cornerRadius(10.0)
        )
    }
}


struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct CustomBackButtonView: View {
    let action:()->Void
    
    var body: some View {
        Button(action:action, label:{
            Image(systemName: "chevron.backward").padding(.all,12)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        })
    }
}
