import 'entity.dart';

class UnitEntity implements Entity {
  UnitEntity({this.name = UnitNames.none});

  int? id;
  UnitNames name;

  double convertTo(double valueFrom, UnitNames unitTo) {
    if (name == unitTo) return valueFrom;
    Map<UnitNames, int> weightUnitsToRatio = {
      UnitNames.kg: 1000000,
      UnitNames.g: 1000,
      UnitNames.mg: 1
    };
    List<UnitNames> weightUnits = weightUnitsToRatio.keys.toList();
    if (weightUnits.contains(name) && weightUnits.contains(unitTo)) {
      return valueFrom *
          weightUnitsToRatio[unitTo]! /
          weightUnitsToRatio[name]!;
    }
    Map<UnitNames, int> volumeUnitsToRatio = {
      UnitNames.ml: 1,
      UnitNames.l: 1000,
      UnitNames.teaSpoon: 5,
      UnitNames.tableSpoon: 15
    };
    List<UnitNames> volumeUnits = volumeUnitsToRatio.keys.toList();
    if (volumeUnits.contains(name) && volumeUnits.contains(unitTo)) {
      return valueFrom *
          volumeUnitsToRatio[unitTo]! /
          volumeUnitsToRatio[name]!;
    }
    return -1;
  }
}

enum UnitNames { mg, g, kg, ml, l, teaSpoon, tableSpoon, aLittle, none }
