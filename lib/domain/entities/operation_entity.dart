import 'entity.dart';
import 'image_entity.dart';

class OperationEntity implements Entity {
  OperationEntity({this.text = ""});

  int? id;
  ImageEntity image = ImageEntity();
  String text;

  void setImage(ImageEntity image) {
    this.image = image;
  }

  void removeImage() {
    image = ImageEntity();
  }

  void setText(String text) {
    this.text = text;
  }
}