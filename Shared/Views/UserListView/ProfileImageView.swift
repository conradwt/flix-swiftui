//
//  ProfileImageView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct ProfileImageView: View {
    var imageName: String
    var width: CGFloat
    var height: CGFloat
  
    var body: some View {
      Image(imageName)
        .resizable()
        .scaledToFit()
        .frame(width: width, height: height, alignment: .center)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(imageName: "conradwt", width: 100, height: 100)
    }
}
