//
//  Info.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 27/05/23.
//

import SwiftUI

struct Info: View {
    @Binding var showInfo : Bool
    var body: some View {
        VStack{
            
            HStack(spacing: 120){
                Button(action: {
                    showInfo = false
                }){
                    Image(systemName: "arrow.backward").font(.title2).fontWeight(.bold)
                }
                Text("About").font(.title2).fontWeight(.bold)
                Text(" ").font(.title2).fontWeight(.bold)
                
                
            }
            VStack(spacing:15){
                VStack(spacing:10){
                    Text("Developers").font(.title2).bold()
                    Text("Edgar D. Narvaez Mariche").font(.title3)
                    Text("Oscar U. Sierra Martinez").font(.title3)
                }
                VStack{
                    Text("University Career").font(.title2).bold()
                    Text("Ing. en Desarrollo de Software").font(.title3)
                }
                
                VStack{
                    Text("Semester").font(.title2).bold()
                    Text("8vo T.V.").font(.title3)
                }
                VStack{
                    Text("Prog. Móvil Avanzada").font(.title2).bold()
                    Text("Arturo De Casso").font(.title3)
                }
                VStack{
                    Text("Organization").font(.title2).bold()
                    Text("DASC").font(.title3)
                }
                Spacer()
                HStack{
                    Image("logo_dasc").resizable().scaledToFit()
                    Image("logo_uabcs").resizable().scaledToFit()
                }
                
                
            }.foregroundColor(.black).monospaced().padding().padding(.horizontal).background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.5))
            )
            Spacer()
        }
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info(showInfo: .constant(false))
    }
}
