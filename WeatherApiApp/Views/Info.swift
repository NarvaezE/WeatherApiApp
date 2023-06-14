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
            HStack{
                Button(action: {
                    showInfo = false
                }){
                    Text("Regresar")
                }
                

            }
        }
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        Info(showInfo: .constant(false))
    }
}
