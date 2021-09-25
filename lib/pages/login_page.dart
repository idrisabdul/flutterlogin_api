import 'package:belajar/model/data_model.dart';
import 'package:belajar/model/login_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  final TextEditingController _controller_username = TextEditingController();
  final TextEditingController _controller_pass = TextEditingController();
  APIService dataRespon = APIService(
    errorcode: 0,
    errormessage: '',
    token: '',
    data: Data(
        nama_lengkap: '',
        id: '',
        owner_id: '',
        img_foto: '',
        role_id: 4,
        role_name: '',
        owner_name: '',
        owner_address: '',
        owner_phone: '',
        punya_cabang: 0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN API DEPOOPTIK'),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: globalFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _controller_username,
              decoration: InputDecoration(
                hintText: 'Username = 012345678901',
              ),
              onSaved: (input) => input!,
              validator: (value) {
                if (value != "012345678901") {
                  return 'Username wrong!! 012345678901';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _controller_pass,
              maxLength: 16,
              maxLengthEnforced: true,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password = demo@@1234##',
              ),
              validator: (value) {
                if (value != "demo@@1234##") {
                  return 'Password Wrong!! demo@@1234##';
                }
                return null;
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              minWidth: 85.0,
              height: 50.0,
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                if (globalFormKey.currentState!.validate()) {
                  APIService.connectAPI("374add6be878e017b7304a7bd5d54080",
                          _controller_username.text, _controller_pass.text)
                      .then((value) {
                    if (value.data.id.isNotEmpty) {
                      final snackBar = SnackBar(
                        content: const Text('Yay! Response data success'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        dataRespon = value;
                      });
                    } else {
                      final snackBar = SnackBar(
                        content: const Text('Yay! A SnackBar!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    print(value.data);
                  });
                }
              },
              child: Text('Submit'),
            ),
            Text(
              "Response",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(dataRespon.errorcode != null
                ? " Errorcode : " + dataRespon.errorcode.toString()
                : "null"),
            Text(dataRespon.errormessage != null
                ? " Error message : " + dataRespon.errormessage
                : "null"),
            Text(dataRespon.token != null
                ? " Token : " + dataRespon.token
                : "null"),
            Text(
              "data",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(dataRespon.data.id != null
                ? " ID : " + dataRespon.data.id
                : "null"),
            Text(dataRespon.data.nama_lengkap != null
                ? " Nama Lengkap : " + dataRespon.data.nama_lengkap
                : "null"),
            Text(dataRespon.data.img_foto != null
                ? " IMG FOTO : " + dataRespon.data.img_foto
                : "null"),
            Text(dataRespon.data.owner_id != null
                ? " Owner ID : " + dataRespon.data.owner_id
                : "null"),
            Text(dataRespon.data.nama_lengkap != null
                ? " Nama Lengkap : " + dataRespon.data.nama_lengkap
                : "null"),
            Text(dataRespon.data.owner_address != null
                ? "Alamat Pemilik : " + dataRespon.data.owner_address
                : "null"),
            Text(dataRespon.data.owner_name != null
                ? " Owner Name : " + dataRespon.data.owner_name
                : "null"),
            Text(dataRespon.data.role_name != null
                ? " Role Name : " + dataRespon.data.role_name
                : "null"),
            Text(dataRespon.data.owner_phone != null
                ? " Owner Phone : " + dataRespon.data.owner_phone
                : "null"),
            Text(dataRespon.data.punya_cabang != null
                ? " Punya Cabang : " + dataRespon.data.punya_cabang.toString()
                : "null"),
          ],
        ),
      ),
    );
  }
}
