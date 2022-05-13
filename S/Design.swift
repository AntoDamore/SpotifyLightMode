//
//  Design.swift
//  S
//
//  Created by Antonio D'amore on 15/12/21.
//

import SwiftUI

struct DesignView: View {
    @State var name: String
    @State  var tap = false
    
    var body: some View {
    
            HStack{
                
                   Image("cerchietto")
                    .padding()
                Image("Play")
                
                        Text(name)
                Spacer()
                Button(action: {
                    tap.toggle()
                    
                } , label: {
                        if tap  {
                            Image(systemName: "heart.fill")

                            .foregroundColor(.green)
                            .padding(.leading,40)
                        
                    }
                       else
                    {
                    Image(systemName: "heart")

                        .foregroundColor(.green)
                        .padding(.leading,40)
                }
                    
                } )
                Image("download")
                    .resizable()
                    .frame(width: 20, height: 20)
                       
                       
                          
                    
        
            }
            
           
        
    }
}

//struct Design_Previews: PreviewProvider {
//    static var previews: some View {
//        DesignView(name: <#String#>, age: <#Int#>, gender: <#String#>)
//    }
//}
