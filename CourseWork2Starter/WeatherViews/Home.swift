//
//  HomeView.swift
//  CWK2_23_GL
//
//  Ranul Akmeemana on 2023-03-31.
//

import SwiftUI
import CoreLocation

struct Home: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var isSearchOpen: Bool = false
    @State  var userLocation: String = ""
    
    
    var body: some View {
        ZStack {
            
//            Image("background2")
//                .resizable()
//                .ignoresSafeArea()
//                .overlay(.ultraThinMaterial)

            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.vertical)
            
            VStack (spacing: 20) {
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(userLocation)
                            .font(.system(size: 56))
                            .bold()
                            .multilineTextAlignment(.leading)
                        
                        Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.dt ?? 0))))
                            .formatted(.dateTime.year().hour().month().day()))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    

                    Spacer()
                    
                    
                    VStack (alignment: .center, spacing: 20) {
                        Label {
                            Text("Humidity : \(modelData.forecast!.current.humidity)%")
                        } icon: {
                            Image(systemName: "humidity")
                                .foregroundColor(.yellow)
                        }
                        
                        Label {
                            Text("Pressure : \(modelData.forecast!.current.pressure) hPa")
                        } icon: {
                            Image(systemName: "speedometer")
                                .foregroundColor(.green)
                        }
                    }
//                    .frame(alignment: .center)
                    .font(.title)
//                    .padding()
//                    .background(.ultraThinMaterial)
//                    .background(.blue.opacity(0.5))
//                    .foregroundStyle(.white)
//                    .cornerRadius(20)
                    
                    Spacer()
                    //                    VStack {
                    //                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                    //
                    //                        Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
                    //                            .textCase(.uppercase)
                    //                            .padding()
                    //                            .font(.title2)
                    //                            .bold()
                    //
                    //                    }
                    //                    .padding()
                    //                    .background(.ultraThinMaterial)
                    //                    .cornerRadius(20)
                    //                    Spacer()
                    
                    VStack {
                        HStack {
                            
                            VStack (spacing: 20) {
                                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                                
                                Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
                            }
                            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
                            .frame(width: 100, alignment: .leading)
                            
                            
                            Spacer()
                            
                            Text("\((Int)(modelData.forecast!.current.temp))°")
                                .font(.system(size: 120))
                                .fontWeight(.bold)
                                .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
                                .mask(LinearGradient(colors: [.white, .white, .clear], startPoint: .top, endPoint: .bottom))
                            
                            
                            
//                            VStack {
//
//                                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
//
//                                Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
//                            }
//                            //                            .padding(.init(top: 0, leading: 20, bottom: 0, trailing: 0))
////                            .frame(width: 100, alignment: .center)
//
//                            Spacer()
//
//                            VStack {
//                                Text("\((Int)(modelData.forecast!.current.temp))°C")
//                                    .font(.system(size: 88))
//                                    .fontWeight(.bold)
//
////                                Label {
////                                    Text("Temperature")
////                                } icon: {
////                                    Image(systemName: "thermometer.low")
////                                        .foregroundColor(.red)
////
////
////                                }
//                            }
                            
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 20)
                    
                }
                Button {
                    self.isSearchOpen.toggle()
                } label: {
                    Image(systemName: "location.fill")
                    Text("Change Location")
                        .bold()
                }
                .font(.system(size: 15))
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .cornerRadius(30)
                .sheet(isPresented: $isSearchOpen) {
                    SearchView(isSearchOpen: $isSearchOpen, userLocation: $userLocation)
                }
                //                .background(.ultraThinMaterial)
                .padding()
                
                Spacer()
            }
            .padding(.bottom, UIScreen.main.bounds.height * 0.05)
            .frame(maxWidth: .infinity)
//            .frame(maxHeight: UIScreen.main.bounds.height * 0.75)
            .padding()
            .onAppear {
                Task.init {
                    self.userLocation = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
                    
                    modelData.userLocation = self.userLocation
                    
                }
                
            }
        }
    }
}
