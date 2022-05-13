//
//  Album.swift
//  S
//
//  Created by Antonio D'amore on 14/12/21.
//

import SwiftUI

struct Album: View {
   
    
    var body: some View {
        ScrollView( showsIndicators: false){
            HStack(){
                VStack{
                Image("cover1")
                    Text("Album 1")
                        .font(.body)
                        .fontWeight(.medium)
                       
                }
                VStack{
                Image("cover2")
                    Text("Album 2")
                }
                
                
                
            }
            HStack{
                VStack{
                Image("cover3")
                    Text("Album 3")
                }
                VStack{
                Image("cover4")
                    Text("Album 4")
                }
                
                
            }
        }
//        .padding(.top, 500.0)
        //        .position(x: 100, y:850)
    }
}
struct Album_Previews: PreviewProvider {
    static var previews: some View {
        Album()
    }
}
