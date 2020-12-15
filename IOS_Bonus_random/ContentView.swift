//
//  ContentView.swift
//  IOS_Bonus_random
//
//  Created by 翁星宇 on 2020/12/15.
//

import SwiftUI

struct ContentView: View {
    var dinnerList: [String] = [
        "胖老爹炸雞", "轉角雞排", "吉利串燒", "路邊烤肉", "麥當勞", "漢堡王",  "肯德基"
    ]
    var drinkList: [String] = [
        "可不可紅茶", "ComeBuy", "大苑子", "迷客夏", "龜記"
    ]
    @State private var dinner: String = "什麼`"
    @State private var drink: String?
    @State private var showDrink: Bool = false
    @State private var opc: Double = 0.0
    var body: some View {
        ZStack{
            Image("bg")
                .blur(radius: 7)
                .edgesIgnoringSafeArea(.all)
            VStack{
            Text("今晚，我想來點：").bold()
            
            Button(action: {
                dinner = dinnerList[Int.random(in: 0..<dinnerList.count)]
                opc = 1.0
                drink = nil
            }, label: {
                VStack{
                    Image(systemName: "app.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                        .accentColor(.black)
                        .overlay(VStack(alignment: .leading){
                            Text("Swift").font(.system(size: CGFloat(30))).bold().accentColor(.white)
                            Text("Eats").font(.system(size: CGFloat(30))).fontWeight(.heavy).accentColor(Color(red: 7/255.0, green: 193/255.0, blue: 104/255.0))
                        })
                    Text("點我一下").bold()
                }
            })

            Text(dinner)
                .fontWeight(.heavy)
                .font(.system(size: CGFloat(36)))
                .opacity(opc)
                .animation(.easeOut)
                .padding(5)
                .onTapGesture{
                    drink = drinkList.randomElement()!
                }
            if let drink = drink{
                VStack{
                    Text("配")
                    Text(drink)
                        .fontWeight(.heavy)
                        .font(.system(size: CGFloat(24)))
                        .padding(5)
                }
            }
        }// END VStack
        }// END ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
