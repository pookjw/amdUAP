//
//  ContentView.swift
//  amdUAP
//
//  Created by pook on 11/8/19.
//  Copyright © 2019 pook. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    var navigationButton: some View{
        HStack{
            Button(action: { self.userData.data = load("iOS13DeveloperSeed.plist")}){
                Text("Button")
            }
        }
    }
    
    var body: some View {
        /*
        VStack{
            Text("Hello, World!")
            if self.userData.data != nil{
            Text(self.userData.data!.SigningKey)
                Text(self.userData.data!.Assets[0].Build)
                Text(self.userData.data!.Assets[0].SupportedDeviceModels[0])
            }
            Button(action: { self.userData.data = load("iOS13DeveloperSeed.plist")}){
                Text("Button")
            }
        }*/
        NavigationView{
            List{
                if self.userData.data != nil {
                    ForEach(self.userData.data!.Assets, id: \.self){ value in
                        HStack{
                            Text("\(value.SupportedDevices[0])_\(value.OSVersion)_\(value.Build)")
                        }
                        
                    }
                }else{
                    Text("Click Button")
                }
            }
            .navigationBarTitle(Text("amdUAP"), displayMode: .inline)
            .navigationBarItems(trailing: navigationButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
