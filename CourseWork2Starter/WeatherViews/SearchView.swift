//
//  SearchView.swift
//  CWK2_23_GL
//
//  Ranul Akmeemana on 2023-03-31.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) var dismiss
    
    @Binding var isSearchOpen: Bool
    @State var location = ""
    @Binding var userLocation: String
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                .opacity(0.1)
            //                    .blur(radius: 10)
            //                    .overlay(.ultraThinMaterial)
            VStack {
                HStack{
                    TextField("Enter New Location", text: self.$location, onCommit: {
                        searchLocation()
                    } //Commit
                              
                              
                              
                    )// TextField
                    .cornerRadius(10)
                    .textFieldStyle(.roundedBorder)
                    //.background(Color("background"))
                    //                .cornerRadius(15) // TextField
                    
                    Spacer()
                    
                    Button {
                        searchLocation()
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                    }
                    .tint(.blue)
                    .font(.title)
                    
                    
                }//HStak
                .padding()
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle.fill")
                }
                .font(.system(size: 48))
                .tint(.gray)
                .padding()
                
            }
        }//
        
    }// Some
    
    func searchLocation() {
        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            if let lat = placemarks?.first?.location?.coordinate.latitude,
               let lon = placemarks?.first?.location?.coordinate.longitude {
                
                Task {
                    let _ = try await modelData.loadData(lat: lat, lon: lon)
                    userLocation = location
                    modelData.userLocation = location
                }
                
                
            }
            
            
        } //GEOCorder
        isSearchOpen.toggle()
        dismiss()
        
    }
    
} //View
