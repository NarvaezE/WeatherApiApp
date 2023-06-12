//
//  SplashScreen.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showMainView = false
    let persistenceController = PersistenceController.shared
    var body: some View {
        ZStack {
            Image(systemName: "cloud.fill") // Reemplaza "splashImage" con el nombre de tu imagen
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(showMainView ? 0 : 1)
                .animation(.easeInOut(duration: 0.5))
            
            if showMainView {
                TabBar()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    showMainView = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
