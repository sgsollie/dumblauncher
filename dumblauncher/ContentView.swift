//
//  ContentView.swift
//  dumblauncher
//
//  Created by Ollie Young on 03/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 35) {
                Spacer()
                
                AppButton(name: "msg", url: "whatsapp://")
                AppButton(name: "tunes", url: "spotify://")
                AppButton(name: "web", url: "x-web-search://")
                AppButton(name: "settings", url: "App-prefs://")
                AppButton(name: "camera", url: "shortcuts://run-shortcut?name=Open%20Camera")
                
                Spacer()
            }
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}

struct AppButton: View {
    let name: String
    let url: String
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            if let url = URL(string: url) {
                UIApplication.shared.open(url)
            }
        }) {
            HStack {
                Text(name)
                    .font(.system(size: 25, weight: .light))
                    .foregroundColor(.white.opacity(0.8))
                Spacer()
            }
            .padding(.horizontal, 40)
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .opacity(isPressed ? 0.5 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
