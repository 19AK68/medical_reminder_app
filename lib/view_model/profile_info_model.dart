import 'package:medical_reminder/models/users.dart';
import 'package:medical_reminder/services/database_services.dart';
import 'package:medical_reminder/util/validation/validation_item.dart';
import 'package:medical_reminder/view_model/base_model.dart';

class ProfileInfoModel extends BaseModel {
  DataBaseServices _db = DataBaseServices();
  Map<String, dynamic> _dataProfile ;

  Map<String, dynamic> get dataProfile => _dataProfile;
  String lastEnteredValue;
  String nickName = 'name';

  fetchUser() {
    if (_dataProfile == null) {


      _dataProfile =   _db.getDataProfile();

      notifyListeners();
      return _dataProfile;
    }
  }

  changeName(String oldName) {



      if (oldName== lastEnteredValue) {



        return null;
      }

      _db.updateDisplayName(lastEnteredValue);

        notifyListeners();




    }

    getProf(){


      return   _db.getDataProfile();

    }
  ValidationItem get name => _name;
  ValidationItem _name = ValidationItem(null, null);

  void upName(String value) {
    if ((value.length >= 2) && !value.isNotEmpty) {
      _name = ValidationItem(value, null);
    } else {
      _name =
          ValidationItem(null, "Name should contains more then 3 character");
    }
    notifyListeners();
  }
}
