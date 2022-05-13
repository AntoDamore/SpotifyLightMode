//
//  About.swift
//  S
//
//  Created by Antonio D'amore on 14/12/21.
//

import SwiftUI

struct About: View {
    var body: some View {
        ScrollView{
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium velit ornare massa varius. In ut eget mauris neque facilisi non scelerisque. Congue ullamcorper dolor mauris phasellus. Rhoncus posuere egestas ultrices vel pellentesque eu aliquam consectetur.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium velit ornare massa Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium velit ornare massa varius. In ut eget mauris neque facilisi non scelerisque. Congue ullamcorper dolor mauris phasellus. Rhoncus posuere egestas ultrices vel pellentesque eu aliquam consectetur.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium velit ornare massa Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium velit ornare massa varius. In ut eget mauris neque facilisi non scelerisque. Congue ullamcorper dolor mauris phasellus. Rhoncus posuere egestas ultrices vel pellentesque eu aliquam consectetur.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pretium velit ornare massa ")
            .font(.body)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
            .lineLimit(19)
//            .padding(.top, 470.0)
            
        }        .padding(.horizontal, 16)
        
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
