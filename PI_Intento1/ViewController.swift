//
//  ViewController.swift
//  PI_Intento1
//
//  Created by Manuela Garcia on 23/07/18.
//  Copyright © 2018 Manuela Garcia. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(OpenCVWrapper.openCVVersionString())")
        
        let openCVWrapper = OpenCVWrapper()
        openCVWrapper.isThisWorking()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //imageView.image = userPickedImage
            self.imageView.image = OpenCVWrapper.convert(userPickedImage)
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert to CIImage")
            }
            //detect(image: ciimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
//    func detect(image: CIImage){
//        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
//            fatalError("Loading CoreML model failed.")
//        }
//        let request = VNCoreMLRequest(model: model) { (request, error) in
//            guard let results = request.results as? [VNClassificationObservation] else {
//                fatalError("Model failed to process image")
//            }
//            print(results)
//        }
//        let handler = VNImageRequestHandler(ciImage: image)
//        do {
//            try handler.perform([request])
//        }
//        catch {
//            print(error)
//        }
//    }
    

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func fotosTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

}

