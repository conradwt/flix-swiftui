//
//  PosterImageView.swift
//  Flix
//
//  Created by Conrad Taylor on 5/31/21.
//

import SwiftUI

struct PosterImageView: View {
  @ObservedObject var imageLoader:ImageLoader
  @State var image: UIImage = UIImage()
  
  init(withURL url:String) {
    imageLoader = ImageLoader(urlString:url)
  }
  
  var body: some View {
    Image(uiImage: image)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width:100, height:100)
      .onReceive(imageLoader.didChange) { data in
        self.image = UIImage(data: data) ?? UIImage()
      }
  }
}

class ImageLoader: ObservableObject {
  var didChange = PassthroughSubject<Data, Never>()
  var data = Data() {
    didSet {
      didChange.send(data)
    }
  }
  
  init(urlString:String) {
    guard let url = URL(string: urlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data else { return }
      DispatchQueue.main.async {
        self.data = data
      }
    }
    task.resume()
  }
}

struct AsyncImage<Placeholder: View>: View {
  @StateObject private var loader: ImageLoader
  private let placeholder: Placeholder
  
  init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
    self.placeholder = placeholder()
    _loader = StateObject(wrappedValue: ImageLoader(url: url))
  }
  
  var body: some View {
    content
      .onAppear(perform: loader.load)
  }
  
  private var content: some View {
    placeholder
  }
}

struct PosterImageView_Previews: PreviewProvider {
    static var previews: some View {
        PosterImageView()
    }
}
