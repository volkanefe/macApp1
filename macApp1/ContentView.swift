//
//  ContentView.swift
//  macApp1
//
//  Created by VOLKAN EFE on 8.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isim: String = ""
    @State private var mesajGoster = false
    @State private var darkMode = false
    var body: some View {
        VStack(spacing: 20){
            Text("SwiftUI'ye Hoşgeldin!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(darkMode ? .white : .black)
                .padding(.top, 40)
            
            TextField("Adınızı girin", text: $isim)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(width: 300)
                .onChange(of: isim){
                    if isim.isEmpty {
                        mesajGoster = false
                    }
                }
            
            Button("Merhaba De!"){
                withAnimation{
                    mesajGoster = true
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            
            if mesajGoster {
                Text("Merhaba, \(isim)!")
                    .font(.title2)
                    .foregroundColor(darkMode ? .green : .purple)
                    .transition(.scale)
            }
            
            Spacer()
            
            Toggle("Karanlık Mod", isOn: $darkMode)
                .toggleStyle(.switch)
                .foregroundColor(darkMode ? .white : .black)
                .padding()
            
        }
        .padding()
        .frame(width:400, height: 300)
        .background(darkMode ? Color.black : Color.white)
        .animation(.easeInOut, value: darkMode)
    }
}

#Preview {
    ContentView()
}
