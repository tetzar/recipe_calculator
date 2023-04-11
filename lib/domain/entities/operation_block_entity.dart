import 'entity.dart';
import 'operation_entity.dart';

class OperationBlockEntity implements Entity {
  OperationBlockEntity({this.name = ""});

  int? id;
  String name;
  List<OperationEntity> operations = [];

  void setName(String name) {
    this.name = name;
  }

  void addOperation(OperationEntity operation, [int index = -1]) {
    if (index < 0) {
      operations.add(operation) ;
    } else {
      operations.insert(index, operation);
    }
  }

  void removeOperation(int index) {
    operations.removeAt(index);
  }
}