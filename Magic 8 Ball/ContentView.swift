//
//  ContentView.swift
//  Magic 8 Ball
//
//  Created by Vincio on 7/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()

            ZStack {
                RadialGradient(gradient: Gradient(colors: [ .blue ,Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))]), center: .center, startRadius: 1, endRadius: 200)
                    .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Triangle())
                    .rotationEffect(.degrees(180))


                Triangle()
                    .stroke(Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)).opacity(1), lineWidth: 8)
                    .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .rotationEffect(.degrees(180))
                    .blur(radius: 2)


            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
