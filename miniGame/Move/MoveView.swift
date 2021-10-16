//
//  MoveView.swift
//  miniGame
//
//  Created by james on 2021/10/16.
//

import SwiftUI

struct Trail: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

struct TrailRow: View {
    var trail: Trail
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Image(trail.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text(trail.name)
            }
        }
    }
}

struct DetailView: View {
    var trail: Trail
    
    @State private var breadOffset = CGSize(width: -800, height: 0)
    @State private var fishOffset = CGSize(width: -800, height: 0)
    
    var body: some View {
        HStack {
            Image(trail.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .leading)
            
            
            
            
            
            Spacer()
            
            ZStack {
                Image("jesus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)
                    .offset(CGSize(width: 0, height: -100))
                
                VStack {
                    
                    Group {
                        HStack {
                            Image("fish")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(fishOffset)
                            Image("fish")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(fishOffset)
                        }
                        
                    }
                    Group {
                        HStack {
                            Image("bread")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(breadOffset)
                                .onTapGesture {
                                    withAnimation(Animation.easeOut(duration: 2)) {
                                        breadOffset = CGSize(width: 10, height: 0)
                                    }
                                }
                            Image("bread")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(breadOffset)
                                .onTapGesture {
                                    withAnimation(Animation.easeOut(duration: 2)) {
                                        breadOffset = CGSize(width: 10, height: 0)
                                    }
                                }
                        }
                        
                        HStack {
                            Image("bread")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(breadOffset)
                                .onTapGesture {
                                    withAnimation(Animation.easeOut(duration: 2)) {
                                        breadOffset = CGSize(width: 10, height: 0)
                                    }
                                }
                            Image("bread")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(breadOffset)
                                .onTapGesture {
                                    withAnimation(Animation.easeOut(duration: 2)) {
                                        breadOffset = CGSize(width: 10, height: 0)
                                    }
                                }
                            Image("bread")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(breadOffset)
                                .onTapGesture {
                                    withAnimation(Animation.easeOut(duration: 2)) {
                                        breadOffset = CGSize(width: 10, height: 0)
                                    }
                                }
                            
                        }
                    }
                    
                    
                }
                
                
            }
            
            
        }
    }
}

struct MoveView: View {
    @State private var dragAmount = CGSize.zero
    let Children = [
        Trail(name: "희준이", image: "5"),
        Trail(name: "선율이", image: "3"),
        Trail(name: "율이", image: "4"),
        Trail(name: "라현이", image: "1-1")
        
    ]
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationView {
            
            List(Children) { child in
                NavigationLink(destination: DetailView(trail: child)) {
                    TrailRow(trail: child)
                }
                
            }
            .navigationTitle("잠실 교회 유치부 ❤️")
        }
        
        
//        Image("1-1")
//            .resizable()
//            .scaledToFit()
//            .frame(width: 200, height: 200)
////            .frame(width: 100, height: 100)
//
////            .scaledToFit()
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged{ dragAmount = $0.translation }
////                    .onEnded{ _ in dragAmount =  }
//            )
    }
}

struct MoveView_Previews: PreviewProvider {
    static var previews: some View {
        MoveView()
    }
}
