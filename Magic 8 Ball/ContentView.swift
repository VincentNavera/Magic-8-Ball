//
//  ContentView.swift
//  Magic 8 Ball
//
//  Created by Vincio on 7/20/21.
//

import SwiftUI

struct ContentView: View {
    @State private var degrees = 0
    @State private var move = false
    @State private var showAnswer = false
    let answers = ["Yes - definitely", "It is decidedly so", "Without a doubt", "Reply hazy, try again", "Ask again later", "Better not tell you now", "My sources say no", "Outlook not so good", "Very doubtful"]
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()

                ZStack {
                    RadialGradient(gradient: Gradient(colors: [ .blue, Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))]), center: .center, startRadius: 1, endRadius: 200)
                        .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .clipShape(Triangle())
                        .rotationEffect(.degrees(180))


                    Triangle()
                        .stroke(Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)).opacity(1), lineWidth: 8)
                        .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .rotationEffect(.degrees(180))
                        .blur(radius: 2)
                    if showAnswer {
                        Text(answers[Int.random(in: 0..<answers.count)].uppercased())
                            .font(.headline)

                            .fontWeight(.thin)
                            .multilineTextAlignment(.center)
                            .frame(width: 100, height: 100, alignment: .top)
                            .foregroundColor(.yellow)
                            .shadow(color: .yellow, radius: 5, x: 0.0, y: 0.0)
                            .blur(radius: 0.4)
                            .transition(.modifiedTransition)
                            .animation(.interpolatingSpring(stiffness: 5, damping: 1))


                    }


                }
                .offset(x: move ? CGFloat(degrees) : 0, y: move ? CGFloat(degrees) : 0)
                .rotation3DEffect(.degrees(Double(degrees)),
                                  axis: (x: CGFloat((degrees - 5)/10), y: CGFloat((degrees - 5)/10), z: 1),
                    anchor: .center,
                    anchorZ: CGFloat(degrees/100),
                    perspective: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/
                )
                .animation(Animation.interpolatingSpring(stiffness: 5, damping: 1)
            )


            .frame(width: 300, height: 300, alignment: .center)

            


        }

        .onShake {
            degrees += Int.random(in: -20...20)
            move = true
            showAnswer = false

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    degrees = 0
                    move = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                        showAnswer = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 15){
                            showAnswer = false

                        }
                    }

                }
        }
    }
}

extension AnyTransition {
    static var modifiedTransition: AnyTransition {
        AnyTransition.offset(x: 0, y: 5).combined(with: .opacity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
