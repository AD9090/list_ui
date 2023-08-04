import 'list_model.dart';

class user_model{

  // static List<ListModel> list = [];
  static List<ListModel> list = [];
  static List<List<ListModel>> lists = [[]];

  static late ListModel employeeModel;

  static addlist({required String grain, required String weight}){
    employeeModel = ListModel(grain : grain, weight: weight);
    list.add(employeeModel);
  }
}