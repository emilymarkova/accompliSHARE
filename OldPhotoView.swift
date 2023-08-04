////
////  PhotoView.swift
////  group_app
////
////  Created by Emily Markova on 8/3/23.
////
//
//import SwiftUI
//
//struct PhotoView: View {
//    @State var showActionSheet = false
//    @State var showImagePicker = false
//
//    @State var sourceType:UIImagePickerController.SoureType = .camera
//
//    @State var image: UIImage?
//    var body: some View {
//        VStack {
//            if image != nil {
//                Image(uiImage: image!)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width:300, height:300)
//            } else {
//                Image(systemName: "timelapse")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width:300, height:300)
//            }
//            Button(action: {
//                self.showActionSheet = true
//            }) {
//                Text("Show Image Picker")
//            }.actionSheet(isPresented: $showActionSheet){
//                ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons: {
//
//                })
//            }
//        }
//    }
//}
//
//struct PhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoView()
//    }
//}
