//
//  WeatherView.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 10/06/23.
//

import SwiftUI

struct WeatherView: View {
    @State private var showArchive = false
    @State private var showInfo = false
    @Environment(\.managedObjectContext) private var vC
    @ObservedObject private var nextWVM = NextWeatherVM()
    @ObservedObject var currentWVM:CurrentWeatherVM
    var body: some View {
        ZStack{
            SunsetView().ignoresSafeArea()
            
                if showArchive{
                    WeatherArchive(showArchive: $showArchive, viewModel:currentWVM)
                }else if showInfo{
                    Info(showInfo: $showInfo)
                }else{
                    VStack{
                        HStack(spacing: 70){
                            
                            Button(action: {
                                showArchive = true
                            }){
                                Image(systemName: "archivebox.fill")
                            }
                            Text(currentWVM.cityname).foregroundColor(.white).font(.title).bold().monospaced()
                            Button(action: {
                                showInfo = true
                            }){
                                Image(systemName: "questionmark.circle")
                            }
                        }.padding(.horizontal)
                        VStack{
                            
                            
                            
                            Text(currentWVM.date).foregroundColor(.white).font(.title2).bold().monospaced().padding()
                            
                            Text(currentWVM.iconMain).foregroundColor(.white).font(.title3).bold()
                            
                            Text(currentWVM.temperature).foregroundColor(.white).font(.system(size: 160)).bold()
                            Text("Daily Summary").monospaced().foregroundColor(.white)
                            Text("Wind speed is \(currentWVM.windSpeed)").foregroundColor(.white).font(.title3).bold().monospaced()
                            Text("Clouds probability is \(currentWVM.cloudsProb)").foregroundColor(.white).font(.title3).bold().monospaced()
                            Text("Humidity is \(currentWVM.humidity)").foregroundColor(.white).font(.title3).bold().monospaced()

                            HStack{
                                Text(currentWVM.weatherDescription).bold().monospaced().font(.title3).multilineTextAlignment(.leading).aspectRatio(contentMode: .fill).foregroundColor(.white)
                                AsyncImage(
                                    url: URL(string:  "https://openweathermap.org/img/wn/\(currentWVM.weatherIcon).png"),content: { image in image.resizable()
                                            .aspectRatio(contentMode: .fit).frame(width:120, height: 100,alignment: .center)
                                    },
                                    placeholder: {
                                        ProgressView()
                                    }
                                )
                            }.padding().padding(.bottom,-10)
                            
                            
                        }
                        HStack(spacing: 180){
                            Text("Weekly Weather").font(.title3).monospaced()
                            Image(systemName: "arrow.forward").font(.title3).monospaced()
                        }.foregroundColor(.white)
                        ScrollView(.horizontal){
                        if let nextw = nextWVM.forecast{
                            
                                HStack{
                                    
                                    ForEach(nextw.list.indices,id:\.self){ i in
                                        let item = nextw.list[i]
                                        VStack{
                                            Text("\(item.temperature)°").font(.body).fontWeight(.semibold)
                                            AsyncImage(
                                                url: URL(string:  "https://openweathermap.org/img/wn/\(item.icon).png"),content: { image in image.resizable()
                                                        .aspectRatio(contentMode: .fit).frame(width:50, height: 50,alignment: .center)
                                                },
                                                placeholder: {
                                                    ProgressView()
                                                }
                                            )
                                            
                                            Text(dayOfWeek(from: item.date ) ?? "**") .font(.body).fontWeight(.semibold)
                                            Text(formatDate( string: item.date ) ).font(.body).fontWeight(.semibold)
                                            Text(formatHour(timeString: item.timezone) ?? "**").font(.body).fontWeight(.semibold)
                                        }
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 40)
                                                .fill(Color.white.opacity(0.2))
                                        )
                                    }
                                }
                                
                            
                            
                        }else{
                            Text("pipipii")
                        }
                    }
                        
                        
                }
            }
        }.onAppear(perform: currentWVM.refresh)
    }
}

struct SunsetView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(red: 252/255, green: 197/255, blue: 119/255), // Color naranja
            Color(red: 252/255, green: 150/255, blue: 89/255), // Color rojizo
            Color(red: 252/255, green: 94/255, blue: 93/255),  // Color rosado
            Color(red: 252/255, green: 63/255, blue: 111/255), // Color morado
            Color(red: 120/255, green: 59/255, blue: 140/255)   // Color azul
        ]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

func dayOfWeek(from dateString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")

    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let date = dateFormatter.date(from: dateString) else {
        return nil
    }
    
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: date)
    
    let weekdaySymbols = dateFormatter.weekdaySymbols
    let weekdayName = weekdaySymbols?[weekday - 1]
    
    return weekdayName?.capitalized
}
    
    
func formatDate(string: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let date = dateFormatter.date(from: string) else { return "" }
    
    let outputDateFormatter = DateFormatter()
    outputDateFormatter.locale = Locale(identifier: "en_US")
    outputDateFormatter.dateFormat = "MMMM, d, yyyy"
    let formattedDate = outputDateFormatter.string(from: date)
    
    return formattedDate.capitalized
}
    
func formatHour(timeString: String) -> String? {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "HH:mm:ss"
    
    guard let date = inputFormatter.date(from: timeString) else {
        return nil
    }
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "hh:mm a"
    
    let formattedTime = outputFormatter.string(from: date)
    return formattedTime
}



struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(currentWVM: CurrentWeatherVM(currentWCall: CurrentWeatherApi()))
    }
}
