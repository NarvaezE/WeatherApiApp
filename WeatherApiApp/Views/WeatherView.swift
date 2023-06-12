//
//  WeatherView.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 10/06/23.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject private var nextWVM = NextWeatherVM()
    @ObservedObject var currentWVM:CurrentWeatherVM
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            VStack{
                VStack{
                    
                    Text(nextWVM.forecast?.name ?? "papu no")
                     
                }
                VStack{
                    Text(currentWVM.cityname)
                    AsyncImage(
                        url: URL(string:  "https://openweathermap.org/img/wn/\(currentWVM.weatherIcon).png"),
                                                content: { image in
                                                    image.resizable()
                                                        .aspectRatio(contentMode: .fit).frame(width: 80, height: 80, alignment: .center)
                    //                                    .matchedGeometryEffect(id:
                    //                                                "\(product.id)IMAGE", in: animation)
                                                },
                                                placeholder: {
                                                    ProgressView()
                                                }
                                            )
                }.onAppear(perform: currentWVM.refresh)
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(currentWVM: CurrentWeatherVM(currentWCall: CurrentWeatherApi()))
    }
}
