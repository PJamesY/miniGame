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
    @State private var childOffset = CGSize(width: 800, height: 0)
    
    @State private var showHearzt: Bool = false
    @State private var isRock: Bool = true
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//        print("Animation finished")
//    }
    
    var body: some View {
        HStack {
            
            
            
           
            
//            if breadOffset == CGSize(width: 10, height: 0) && fishOffset == CGSize(width: 10, height: 0) {
//                Text("❤️")
//                    .font(.system(size: 100))
//                    .fontWeight(.bold)
//                    .onTapGesture {
//                        withAnimation(Animation.easeOut(duration: 2)) {
//                            childOffset = CGSize(width: 10, height: 0)
//                        }
//                    }
//            }
            
            ZStack {
                Image("jesus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)
                    .offset(CGSize(width: 0, height: -100))
                
                Image(trail.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .leading)
                    .offset(childOffset)
            }
            
            Spacer()
            
            if isRock {
                Image("realRock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 600)
                    .offset(CGSize(width: 0, height: -100))
                    .onTapGesture {
                        withAnimation(Animation.easeOut(duration: 2)) {
                            childOffset = CGSize(width: 10, height: 0)
                            isRock = false
                        }
                    }
            }
            
            
            Spacer()
//
//            ZStack {
//                Image("jesus")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 600, height: 600)
//                    .offset(CGSize(width: 0, height: -100))
//
//                Image(trail.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200, alignment: .leading)
//                    .offset(childOffset)
                    
                
//                VStack {
                    
//                    Group {
//                        HStack {
//                            Image("fish")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 100)
//
//                            Image("fish")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 100)
//                        }
//                        .offset(fishOffset)
//                        .onTapGesture {
//                            withAnimation(Animation.easeOut(duration: 2)) {
//                                fishOffset = CGSize(width: 10, height: 0)
//                            }
//                        }
//                    }
//                    Group {
//                        HStack {
//                            Image("bread")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 100)
//                                .offset(breadOffset)
//                                .onTapGesture {
//                                    withAnimation(Animation.easeOut(duration: 2)) {
//                                        breadOffset = CGSize(width: 10, height: 0)
//                                    }
//                                }
//                            Image("bread")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 100)
//                                .offset(breadOffset)
//                                .onTapGesture {
//                                    withAnimation(Animation.easeOut(duration: 2)) {
//                                        breadOffset = CGSize(width: 10, height: 0)
//                                    }
//                                }
//                        }
//
//                        HStack {
//                            Image("bread")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 100)
//                                .offset(breadOffset)
//                                .onTapGesture {
//                                    withAnimation(Animation.easeOut(duration: 2)) {
//                                        breadOffset = CGSize(width: 10, height: 0)
//                                    }
//                                }
//                            Image("bread")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 100)
//                                .offset(breadOffset)
//                                .onTapGesture {
//                                    withAnimation(Animation.easeOut(duration: 2)) {
//                                        breadOffset = CGSize(width: 10, height: 0)
//                                    }
//                                }
//                            Image("bread")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 100, height: 100)
//                                .offset(breadOffset)
//                                .onTapGesture {
//                                    withAnimation(Animation.easeOut(duration: 2)) {
//                                        breadOffset = CGSize(width: 10, height: 0)
//                                    }
//                                }
//
//                        }
//                    }
                    
                    
//                }
                
                
//            }
            
            
        }
    }
}

struct Rock:View {
    var imageIdxDict = [0:"rock", 1:"siccior", 2:"paper"]
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var imagIdx = 0
    
    func pause() {
        timer.upstream.connect().cancel()
    }
    
    func resume() {
        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    }
    
    var body: some View {
        if let idx = imageIdxDict[imagIdx] {
            Image(idx)
                .resizable()
                .scaledToFit()
                .frame(width: 600, height: 600)
                .onReceive(timer, perform: {_ in
                    if (imagIdx > 1) {
                        imagIdx = 0
                    } else {
                        imagIdx += 1
                    }
                })
        }
        
        HStack {
            Button(action: {
                pause()
            }) {
                Text("가위바위보")
            }
            
            Spacer()
            
            Button(action: {
                resume()
            }) {
                Text("다시 시작")
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
            VStack {
                NavigationLink(destination: Rock()) {
                    Text("가위바위보")
                }
                
                List(Children) { child in
                    NavigationLink(destination: DetailView(trail: child)) {
                        TrailRow(trail: child)
                    }
                    
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
