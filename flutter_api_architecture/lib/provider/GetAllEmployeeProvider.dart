import 'package:flutter/cupertino.dart';
import 'package:flutterapiarchitecture/model/getAllEmployee/AllEmployee.dart';
import 'package:flutterapiarchitecture/model/getAllEmployee/Data.dart';
import 'package:flutterapiarchitecture/network/APIResponse.dart';
import 'package:flutterapiarchitecture/repository/EmployeeRepository.dart';

class GetAllEmployeeProvider with ChangeNotifier {
  EmployeeRepository _repository;
  GetAllEmployeeProvider() {
    _repository = EmployeeRepository();
    getAllEmployeeList();
  }

  APIResponse<AllEmployee> _employeeList;
  APIResponse<AllEmployee> get employeeList => _employeeList;

  getAllEmployeeList() async {
    _employeeList = APIResponse.loading('loading... ');
    notifyListeners();
    try {
      AllEmployee employee = await _repository.getAllEmployee();
      _employeeList = APIResponse.completed(employee);
      notifyListeners();
    } catch (e) {
      _employeeList = APIResponse.error(e.toString());
      notifyListeners();
    }
  }
}
