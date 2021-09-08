//
//  HelicopterGame.swift
//  miniGame
//
//  Created by james on 2021/09/02.
//

import SwiftUI

struct HelicopterGame: View {
    
    @State private var heliPosition = CGPoint(x:100, y:100)
    @State private var obstPosition = CGPoint(x:800, y:300)
    @State private var isPaused = false
    @State private var score = 9
    
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader { geo in
            
            
            ZStack {
                Helicopter()
                    .position(heliPosition)
                    .onReceive(timer, perform: { _ in
                        gravity()
                    })
                Obstacle()
                    .position(obstPosition)
                    .onReceive(timer, perform: { _ in
                        
                        obsMove()
                        
                        
                    })
                
                
                Text("\(score)")
                    .foregroundColor(.white)
                    .position(x: geo.size.width - 100, y: geo.size.height / 10)
                
                
                
                
                isPaused ? Button("Restart") {resume()} : nil

                Button(action: {
                        self.mode.wrappedValue.dismiss()
                        }) {
                            HStack {
                            Image("ic_back") // set image here
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                Text("Go back")
                            }
                        }
            }
            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: Button(action : {
//                print("back!!!")
//                self.mode.wrappedValue.dismiss()
//            }){
//                Image(systemName: "arrow.left")
//            })
            
            
            .frame(width: geo.size.width, height: geo.size.height)
            .background(Color.black)
            .gesture(TapGesture().onEnded{
                withAnimation {
                    heliPosition.y -= 30
                }
                
            })
            
            .onReceive(timer, perform: { _ in
                print("JJJJJJJ")
                collisionDetection()
                score += 1
            })
            
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//        .navigationBarHidden(true)
        
        
                    
        
        
    }
    
    func goBack() {
//        ContentView()
    }
    
    func gravity() {
        withAnimation {
            heliPosition.y += 10
        }
        
    }
    
    func obsMove() {
        if obstPosition.x > 0 {
            withAnimation {
                obstPosition.x -= 20
            }
        } else {
            obstPosition.x = 1000
            obstPosition.y = CGFloat.random(in: 0...500)
        }
        
    }
    
    func pause() {
        timer.upstream.connect().cancel()
    }
    
    func resume() {
        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        obstPosition.x = 1000
        heliPosition = CGPoint(x:100, y:100)
        isPaused = false
    }
    
    func collisionDetection () {
        
        
        if abs(heliPosition.x  - obstPosition.x) < (25 - 10) && abs(heliPosition.y - obstPosition.y) < (25 + 100) {
            isPaused = true
            pause()
        }
    }
}

struct HelicopterGame_Previews: PreviewProvider {
    static var previews: some View {
        HelicopterGame()
    }
}
