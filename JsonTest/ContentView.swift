//
//  ContentView.swift
//  JsonTest
//
//  Created by Consultant on 1/16/23.
//

import SwiftUI

struct ContentView: View {
   let display: Model
    
    var body: some View {
        VStack {
            HStack {
                Text(display.code)
                Text(display.name)
                Text(display.capital)
            }
        }
        .padding()
    }
}


struct FileView: View {
    @ObservedObject var item: ViewModel
    var body: some View {
        VStack {
            ScrollView {
                ForEach (item.cities) {
                    cont in ContentView(display: cont)
                    
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await item.decode()
                }
                catch let error {
                    print("Download cities error: \(error)")
                }
            }
        }
    }
}
    

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(display: ViewModel())
//    }
//}
