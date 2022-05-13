//
//  ContentView.swift
//  S
//
//  Created by Antonio D'amore on 13/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSegment: Int = 1
    var body: some View {
   
        VStack{
            
        ZStack{
    
        Image("billy")
            .scaledToFill()
            .ignoresSafeArea()
            .padding(.bottom,288.0)
            .blur(radius: 6)
            
                
            VStack{
                
                Spacer(minLength: 300)
                VStack(){
                
            Text("Billy Elish")
                    .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Text("835.45.45 follower")
                    .font(.headline)
           
            .foregroundColor(Color.white)
               
                Button(action: {
                        
                }) {
                    Text("Follow")
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 30)
                    .padding(.all,10)
                        .background(.green)
                        .clipShape(Capsule())
                        
                       
                    
                 }
              
                
            }
//            .position(x: 200, y:350 )
            HStack{
            SegmentedPicker(selectedSegment: $selectedSegment, labels: ["Most Popular", "Album", "About"], markerHeight: 10)
//                .position(x: 200, y: 450)
            }.frame(height: 80)
            
         
            HStack{
            switch selectedSegment {
                  case 0:
              Most_Popular()
            case 1:
                Album()
            case 2:
                About()
           default :
                Album()

            }
          
            }
            }
            }
                
        }
       
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

