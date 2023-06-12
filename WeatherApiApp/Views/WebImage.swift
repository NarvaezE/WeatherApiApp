//
//  WebImage.swift
//  WeatherApiApp
//
//  Created by Edgar Narvaez on 11/06/23.
//

import SwiftUI

struct WebImage: View {
    var body: some View {
        VStack{
            AsyncImage(
                            url: URL(string:  "https://openweathermap.org/img/wn/04d.png"),
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
            
            AsyncImage(
                            url: URL(string:  "https://openweathermap.org/img/wn/04d.png"),
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
            AsyncImage(
                            url: URL(string:  "https://openweathermap.org/img/wn/04d.png"),
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
            AsyncImage(
                            url: URL(string:  "https://openweathermap.org/img/wn/04d.png"),
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
            AsyncImage(
                            url: URL(string:  "https://openweathermap.org/img/wn/04d.png"),
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
            AsyncImage(
                            url: URL(string:  "https://openweathermap.org/img/wn/04d.png"),
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
            
        }
    }
}

struct WebImage_Previews: PreviewProvider {
    static var previews: some View {
        WebImage()
    }
}
