import 'package:recipe_calculator/domain/entities/unit_entity.dart';

import 'entity.dart';

class IngredientEntity implements Entity {
  IngredientEntity({this.name = "", this.amount = 0});
  int? _id;
  String name;
  double amount;
  UnitEntity unit = UnitEntity();

  void setUnit(UnitEntity unit) {
    this.unit = unit;
  }

  double multiple(double multipliedBy) {
    return amount * multipliedBy;
  }

  List<UnitNames> getUnitsCanConvert() {
    List<UnitNames> units = UnitNames.values;
    return units.where((unit) => (this.unit.convertTo(1, unit) > 0)).toList();
  }

  double amountConvertByUnit(UnitNames unitTo) {
    return unit.convertTo(amount, unitTo);
  }

  void convertUnitTo(UnitNames unitTo) {
    amount = amountConvertByUnit(unitTo);
    unit.name = unitTo;
  }

  void optimizeUnit() {
    switch (unit.name) {
      case UnitNames.kg:
        if (amount <= 0.001) convertUnitTo(UnitNames.g);
        if (amount <= 0.001) convertUnitTo(UnitNames.mg);
        break;
      case UnitNames.l:
        if (amount <= 0.001) convertUnitTo(UnitNames.ml);
        break;
      case UnitNames.g:
        if (amount >= 1000) {
          convertUnitTo(UnitNames.kg);
        } else if(amount <= 0.001) {
          convertUnitTo(UnitNames.mg);
        }
        break;
      default:
        break;
    }
  }
}
