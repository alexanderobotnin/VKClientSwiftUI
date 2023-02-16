//
//  PhotoCollectionView.swift
//  SwiftUIVK
//


import SwiftUI
//import ASCollectionView


struct PhotoCollectionView: View {
    
    @ObservedObject var session = SessionSingletone.shared
    
    private var APIRequest = VKAPIService()
    
    private var UIPhotos = ImageLoader().getPhotoCollection(SessionSingletone.shared.photos)
    
    var body: some View {
        
        NavigationView {
            
           Text("Sorry, it's under construction now!")
//            List(UIPhotos) { photo in
//                PhotoCell(photo: photo)
//            }
        .navigationBarTitle(Text("Photos"))
        }
//        .onAppear {
//            APIRequest.photosCollectionRequest()
//        }
        
    }
    
   
}


struct PhotoCell: View {
    
    let photo: UIImage
    
    var body: some View {
        
        HStack {
            Image(uiImage: photo)
        }
    }
}

struct PhotoCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCollectionView()
    }
}
