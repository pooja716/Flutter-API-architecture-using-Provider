import 'package:flutterapiarchitecture/model/getAllEmployee/AllEmployee.dart';

import 'package:flutterapiarchitecture/network/APIHelper.dart';
import 'package:flutterapiarchitecture/utils/Constants.dart';

class EmployeeRepository {
  Future<AllEmployee> getAllEmployee() async {
    var response = await APIHelper.instance.get(API.getAllEmployee);

    return AllEmployee.fromJson(response);
  }
}
