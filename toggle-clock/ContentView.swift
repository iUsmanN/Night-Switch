//
//  ContentView.swift
//  toggle-clock
//
//  Created by Usman Nazir on 04/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Text("Night Switch")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.bottom, 50)
                Image("moon")
                Text("I'd like to switch between")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.top, 50)
                HStack {
                    Text("6pm")
                    Text("to")
                    Text("9pm")
                }
                .foregroundColor(.white)
                .font(.title)
                .padding(.top, 10)
                Spacer()
            }
            .padding(.top, 100)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
