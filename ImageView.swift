////
////  ImageView.swift
////  KWK_accompliSHARE
////
////  Created by Emily Markova on 8/4/23.
////
//
//import SwiftUI
//import FirebaseStorage
//import FirebaseFirestore
//
//struct ImageView: View {
//    @State  var isPickerShowing: Bool = false
//    @State var selectedImage: UIImage?
//    @State var retrievedImages = [UIImage]()
//    var body: some View {
//        VStack {
//            if selectedImage != nil {
//                Image(uiImage: selectedImage!)
//                    .resizable()
//                    .frame(width: 200, height: 200)
//            }
//            Button {
//                isPickerShowing = true
//            } label: {
//                Text("Select a Photo")
//            }
//            if selectedImage != nil {
//                Button {
//                    uploadPhoto()
//                } label: {
//                    Text("Upload photo")
//                }
//            }
//            
//            Divider()
//            HStack {
//                ForEach(retrievedImages, id: \.self){ image in
//                    Image(uiImage: image)
//                        .resizable()
//                        .frame(width: 200, height: 200)
//                }
//            }
//        }
//        .sheet(isPresented: $isPickerShowing, onDismiss: nil){
////            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
//        }
//        .onAppear {
//            retrieveImages()
//        }
//        
//        func uploadPhoto() {
//            let storageRef = Storage.storage().reference()
//            
//            let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
//            
//            guard imageData != nil else {
//                return
//            }
//            
//            let path = "image/\(UUID().uuidString).jpg"
//            let fileRef = storageRef.child(path)
//            
//            let uploadTask = fileRef.putData(imageData!, metadata: nil){
//                metadata, error in
//                if error == nil && metadata != nil {
//                    let db = Firestore.firestore()
//                    db.collection("images").document().setData(["url": path])
//                    if error == nil {
//                        DispatchQueue.main.async {
//                            self.retrievedImages.append(self.selectedImage!)
//                        }
//
//                    }
//                }
//            }
//        }
//        
//        func retrieveImages(){
//            let db = Firestore.firestore()
//            db.collection("images").getDocuments{ snapshot, error in
//                if error == nil && snapshot != nil {
//                    var paths = [String]()
//                    for doc in snapshot!.documents {
//                        paths.append(doc["url"] as! String)
//                    }
//                }
//                for path in paths {
//                    let storageRef = Storage.storage().reference()
//                    
//                    let fileRef = storageRef.child(path)
//                    
//                    fileRef.getData(maxSize: 5 * 1024 * 1024){ data, error in
//                        if error == nil && data != nil {
//                            let image = UIImage(data: data!)
//                            
//                            DispatchQueue.main.async {
//                                retrievedImages.append(image)
//                            }
//                            
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct ImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageView()
//    }
//}
