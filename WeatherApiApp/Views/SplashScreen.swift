//
//  SplashScreen.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showMainView = false
    @Environment(\.managedObjectContext) private var vC
    var body: some View {
        ZStack {
            SunsetView().ignoresSafeArea()
            VStack{
                Image("nube") // Reemplaza "splashImage" con el nombre de tu imagen
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(showMainView ? 0 : 1)
                    .animation(.easeInOut(duration: 0.5))
                Text("MyWeatherApp").font(.title).foregroundColor(.white).monospaced()
            }
            
            if showMainView {
                WeatherView(currentWVM: CurrentWeatherVM(currentWCall: CurrentWeatherApi()))
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
