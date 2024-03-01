class FileManager {
  Map<String, String> files = {
    'file1': 'example.txt',
    'file2': 'file.pdf',
    'file3': 'image.png',
  };
  Map<String, List<String>> folders = {
    'folder1': ['file1', 'file2'],
    'folder2': ['file3'],
  };
  FileManager({required this.files, required this.folders});
  void createFile(String fileName, String folderName) {
    if (!files.containsKey(fileName) && !folders.containsKey(folderName)) {
      files[fileName] = fileName;
      folders[folderName] = [fileName];
      print('$fileName has been created in $folderName.');
    } else {
      print('File or folder not found.');
    }
  }
  void deleteFile(String fileName) {
    if (files.containsKey(fileName)) {
      files.remove(fileName);
      folders.forEach((key, value) {
        if (value.contains(fileName)) {
          value.remove(fileName);
        }
      });
      print('$fileName has been deleted.');
    } else {
      print('File not found.');
    }
  }
}
void main() {
  final fileManager = FileManager(files: {'file1': 'file1.txt', 'file2': 'file2.txt', 'file3': 'file3.txt'}, folders: {'folder1': ['file1', 'file2'], 'folder2': ['file3']});
  fileManager.createFile('file4', 'folder1');
  fileManager.deleteFile('file1');
}