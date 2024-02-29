class ComputerVisionLibrary {
  List<String> _images;
  List<String> _features;

  ComputerVisionLibrary(this._images, this._features);

  
  void detect(String image) {
    print("Detecting features in image: $image");
   
  }

  void track() {
    print("Tracking features across images...");
  
  }
}

void main() {

  List<String> images = ['image1.jpg', 'image2.jpg', 'image3.jpg'];
  List<String> features = ['face', 'object', 'text'];


  var cvLibrary = ComputerVisionLibrary(images, features);


  cvLibrary.detect('image1.jpg');

  cvLibrary.track();
}
