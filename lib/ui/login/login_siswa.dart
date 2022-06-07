import 'package:capstone_project/ui/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late bool obscureText;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body:  Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff8CF6F0),
                    Color(0xff98A7F2),
                  ])),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 12,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'LOGIN',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black54,
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: <Widget>[
                            Material(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                elevation: 2,
                                child: AspectRatio(
                                    aspectRatio: 7 / 1,
                                    child: Center(
                                        child: TextFormField(
                                          decoration: const InputDecoration(hintText: 'Email', border: InputBorder.none, contentPadding: EdgeInsets.all(8)),
                                          controller: emailController,
                                          keyboardType: TextInputType.emailAddress,
                                        )))),
                            Container(
                                margin: const EdgeInsets.only(top: 16),
                                child: Material(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    elevation: 2,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: AspectRatio(
                                              aspectRatio: 7 / 1,
                                              child: Center(
                                                  child: TextFormField(
                                                    decoration: const InputDecoration(hintText: 'Password', border: InputBorder.none, contentPadding: EdgeInsets.all(8)),
                                                    controller: passwordController,
                                                    obscureText: obscureText,
                                                  ))),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: !obscureText ? Colors.black.withOpacity(0.3) : Colors.black,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              obscureText = !obscureText;
                                            });
                                          },
                                        )
                                      ],
                                    ))),
                            Container(
                                margin: const EdgeInsets.only(top: 30),
                                width: MediaQuery.of(context).size.width,
                                child: MaterialButton(
                                  onPressed: (){
                                    loginValidation(context);
                                  },
                                  child: const Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                                  color: const Color(0xFFF58634),
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                                  padding: const EdgeInsets.all(16),
                                )),
                          ],
                        )),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){

                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          InkWell(
                            onTap: (){},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontFamily: "Avenir",
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }

  void loginValidation(BuildContext context) async {
    bool isLoginValid = true;
    FocusScope.of(context).requestFocus(FocusNode());

    if (emailController.text.isEmpty) {
      isLoginValid = false;
      _onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email Tidak Boleh Kosong'),
            backgroundColor: Colors.red,
          ),
        );
      });
    }

    if (passwordController.text.isEmpty) {
      isLoginValid = false;
      _onWidgetDidBuild(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password Tidak Boleh Kosong'),
            backgroundColor: Colors.red,
          ),
        );
      });
    }
    if (isLoginValid) {
      fetchLogin(context, emailController.text, passwordController.text);
    }
  }

  fetchLogin(BuildContext context, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    showLoaderDialog(context);
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(
        'https://reqres.in/api/login',
        data: {
          'email': email,
          'password': password
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      if(response.statusCode == 200){
        //berhasil
        hideLoaderDialog(context);
        //setSharedPreference
        String prefEmail = email;
        String prefToken = response.data['token'];
        await prefs.setString('email', prefEmail);
        await prefs.setString('token', prefToken);
        //Messsage
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Berhasil'),
              backgroundColor: Colors.green,
            ),
          );
        });
        //homePage
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }on DioError catch (e) {
      hideLoaderDialog(context);
      if(e.response?.statusCode == 400){
        //gagal
        String errorMessage = e.response?.data['error'];
        _onWidgetDidBuild(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        });
      }else{
        // print(e.message);
      }
    }
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:const Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  hideLoaderDialog(BuildContext context){
    return Navigator.pop(context);
  }
}
