//
//  ImagePicker.swift
//  xs
//
//  Created by Felipe Vallejo on 15/11/23.
//

import SwiftUI

// para que el usuario pueda elegir una imagen
struct ImagePicker: UIViewControllerRepresentable {
    // para luego tener acceso a la imagen que se selecciono
    @Binding var imagen: UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    // enfocarse en esta funcion
    func makeUIViewController(context: Context) -> some UIViewController {
        // aqui tenemos una variable picker que nos va a mostrar un UIImagePickerController que permitira que eligamos una imagen
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiviewController: UIViewControllerType, context: Context) {
    }
}

extension ImagePicker {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            parent.imagen = image
            parent.mode.wrappedValue.dismiss()
        }
    }
}
