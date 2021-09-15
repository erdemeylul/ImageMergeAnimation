//
//  MatchedGeometry2.swift
//  SwiftuiLab1
//
//  Created by Erdem Senol on 12.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isClicked = false
    @Namespace var animation
    var columns:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    @State var image1 = ""
    @State var image2 = ""
    @State var image3 = ""
    @State var image4 = ""
    
    var body: some View {
        VStack{
            HStack{
                if !isClicked{
                    Image(image1)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "1", in: animation)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    Image(image2)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "2", in: animation)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    Image(image3)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "3", in: animation)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    Image(image4)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "4", in: animation)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    
                }
                Spacer()
                if isClicked{
                    ZStack{
                        Image(image1)
                            .resizable()
                            .scaledToFit()
                            .matchedGeometryEffect(id: "1", in: animation)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        Image(image2)
                            .resizable()
                            .scaledToFit()
                            .matchedGeometryEffect(id: "2", in: animation)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        Image(image3)
                            .resizable()
                            .scaledToFit()
                            .matchedGeometryEffect(id: "3", in: animation)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        Image(image4)
                            .resizable()
                            .scaledToFit()
                            .matchedGeometryEffect(id: "4", in: animation)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        
                    }.offset(x: -160)
                }
            }
            HStack {
                Button(action: {
                    withAnimation(.easeInOut(duration: 2)){
                        isClicked.toggle()
                    }
                }, label: {
                    Text("Merge")
                })
                Button(action: {
                    image1 = ""
                    image2 = ""
                    image3 = ""
                    image4 = ""
                }, label: {
                    Text("Reset")
                })
            }
            LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                ForEach(choices){choice in
                    Image(choice.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .border(Color.black)
                        .onTapGesture {
                            if image1 == ""{
                                image1 = choice.actualImage
                            }else if image1 != "" && image2 == ""{
                                image2 = choice.actualImage
                            }else if image1 != "" && image2 != "" && image3 == ""{
                                image3 = choice.actualImage
                            }else{
                                image4 = choice.actualImage
                            }
                        }
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



struct Choice: Identifiable {
    var id = UUID().uuidString
    let image: String
    let actualImage: String
}

var choices: [Choice] = [
    Choice(image: "11", actualImage: "1"),
    Choice(image: "11", actualImage: "1"),
    Choice(image: "11", actualImage: "1"),
    Choice(image: "33", actualImage: "3"),
    Choice(image: "33", actualImage: "3"),
    Choice(image: "33", actualImage: "3"),
    Choice(image: "22", actualImage: "2"),
    Choice(image: "22", actualImage: "2"),
    Choice(image: "22", actualImage: "2"),
    Choice(image: "44", actualImage: "4"),
    Choice(image: "44", actualImage: "4"),
    Choice(image: "44", actualImage: "4"),
    Choice(image: "11", actualImage: "1"),
    Choice(image: "11", actualImage: "1"),
    Choice(image: "22", actualImage: "2"),
    Choice(image: "22", actualImage: "2"),
    Choice(image: "33", actualImage: "3"),
    Choice(image: "33", actualImage: "3"),
    Choice(image: "44", actualImage: "4"),
    Choice(image: "44", actualImage: "4"),
]
