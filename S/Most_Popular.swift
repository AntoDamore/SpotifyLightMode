//
//  Most_Popular.swift
//  S
//
//  Created by Antonio D'amore on 14/12/21.
//

import SwiftUI

struct Most_Popular: View {
    
    struct Data: Identifiable {
        let id = UUID()
        var name: String
       
    }
    private let values: [Data] = [
           Data(name: "!!!!!!!!"),
           Data(name: "Bad Guy"),
           Data(name: "Xany"),
           Data(name: "You should see me in..")
       ]
    var body: some View {
//        List(oceans) {
//
//
//            Text($0.name)
//
//
//
//
//        }        .padding(.top, 500.0)
        List {
                  ForEach(values){ item in
                      DesignView(name: item.name)

                  }
        }.listStyle(.plain)
//        .padding(.top, 500.0)
        
        
    }
  
}
    


struct Most_Popular_Previews: PreviewProvider {
    static var previews: some View {
        Most_Popular()
    }
}
