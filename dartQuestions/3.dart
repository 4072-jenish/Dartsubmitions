import 'dart:math';

class Image {
  List<List<int>> pixels;

  Image(this.pixels);
}

class Filter {
  List<List<double>> kernel;

  Filter(this.kernel);
}

class ComputerVisionSystem {
  List<Image> images;
  List<Filter> filters;

  ComputerVisionSystem(this.images, this.filters);

  Image applyFilter(Image image, Filter filter) {
    int imageHeight = image.pixels.length;
    int imageWidth = image.pixels[0].length;
    int filterSize = filter.kernel.length;
    int padding = (filterSize / 2).floor();

    List<List<int>> newPixels =
        List.generate(imageHeight, (_) => List.filled(imageWidth, 0));

    for (int y = padding; y < imageHeight - padding; y++) {
      for (int x = padding; x < imageWidth - padding; x++) {
        double newValue = 0;
        for (int i = 0; i < filterSize; i++) {
          for (int j = 0; j < filterSize; j++) {
            newValue += image.pixels[y - padding + i][x - padding + j] *
                filter.kernel[i][j];
          }
        }
        newPixels[y][x] = newValue.round().clamp(0, 255);
      }
    }

    return Image(newPixels);
  }

  Image detectEdges(Image image) {
    Filter sobelFilterX = Filter([
      [-1, 0, 1],
      [-2, 0, 2],
      [-1, 0, 1],
    ]);
    Filter sobelFilterY = Filter([
      [-1, -2, -1],
      [0, 0, 0],
      [1, 2, 1],
    ]);

    Image edgeX = applyFilter(image, sobelFilterX);
    Image edgeY = applyFilter(image, sobelFilterY);

    List<List<int>> combinedPixels =
        List.generate(image.pixels.length, (index) {
      return List.generate(image.pixels[0].length, (index) => 0);
    });

    for (int y = 0; y < image.pixels.length; y++) {
      for (int x = 0; x < image.pixels[0].length; x++) {
        combinedPixels[y][x] =
            sqrt(pow(edgeX.pixels[y][x], 2) + pow(edgeY.pixels[y][x], 2))
                .round()
                .clamp(0, 255);
      }
    }

    return Image(combinedPixels);
  }

  List<String> recognizeObjects(Image image) {
    return ['Object1', 'Object2', 'Object3'];
  }
}

// Example usage
void main() {
  Image exampleImage = Image([
    [100, 50, 75],
    [200, 150, 175],
    [50, 100, 125],
  ]);

  ComputerVisionSystem cvSystem = ComputerVisionSystem([exampleImage], []);

  Image edgeImage = cvSystem.detectEdges(exampleImage);

  print('Edge-detected image:');
  for (var row in edgeImage.pixels) {
    print(row);
  }

  List<String> recognizedObjects = cvSystem.recognizeObjects(exampleImage);
  print('Recognized objects: $recognizedObjects');
}
