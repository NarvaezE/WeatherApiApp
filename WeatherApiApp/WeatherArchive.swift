//
//  WeatherArchive.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import SwiftUI

struct WeatherArchive: View {
    @Binding var showArchive : Bool
    @ObservedObject var viewModel: CurrentWeatherVM
        @Environment(\.managedObjectContext) var moc
        @FetchRequest(entity: ArchiveWeather.entity(), sortDescriptors: []) var arr: FetchedResults<ArchiveWeather>

        var body: some View {
            
                
            VStack{
                HStack(spacing:120){
                    Button(action: {
                        showArchive = false
                    }){
                        Image(systemName: "arrow.backward").font(.title2).fontWeight(.bold)
                    }
                    Text("Weather Archive").multilineTextAlignment(.center).foregroundColor(.black).bold().font(.title2)
                        
                    Text(" ")
                    
                }
                        
                        ScrollView {
                            
                            ForEach(arr, id: \.self ) { i in
                                if i.fecha != "00/00/00"{
                                    VStack{
                                        
                                        HStack {
                                            
                                            VStack{
                                                Text(i.fecha ?? "**")
                                                
                                                Text(i.hora ?? "******")
                                                
                                            }.padding(.leading)
                                            AsyncImage(
                                                url: URL(string:  "https://openweathermap.org/img/wn/\(i.icono ?? "10d").png"),content: { image in image.resizable()
                                                        .aspectRatio(contentMode: .fit).frame(width:50, height: 50,alignment: .center)
                                                },
                                                placeholder: {
                                                    ProgressView()
                                                }
                                            )
                                            VStack{
                                                Text(i.temp ?? "*")
                                                
                                                Text(i.ciudad ?? "******")
                                                
                                            }.padding(.trailing)
                                            
                                        }
                                        .foregroundColor(.black)
                                        .padding().padding(.bottom,-6)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.white.opacity(0.5))
                                        )
                                    }
                                }
                            }
                            
                }.task{
                    let newWeather = ArchiveWeather(context: moc)
                    newWeather.id = UUID()
                    newWeather.ciudad = viewModel.cityname
                    newWeather.fecha = viewModel.date
                    newWeather.icono = viewModel.weatherIcon
                    newWeather.temp = viewModel.temperature
                    newWeather.hora = viewModel.timezone
                    
                    try? moc.save()
                }
    
            }.onAppear(perform: viewModel.refresh).fontWeight(.bold)
        }
}

struct WeatherArchive_Previews: PreviewProvider {
    static var previews: some View {
        WeatherArchive(showArchive: .constant(false), viewModel: CurrentWeatherVM(currentWCall: CurrentWeatherApi()))
    }
}
