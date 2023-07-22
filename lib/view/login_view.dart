import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_botton.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode =FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height *1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Login View"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
           const SizedBox(height: 15,),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'password',
                        prefixIcon: const Icon(Icons.lock_open_outlined),
                        suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                            child: Icon(
                              _obsecurePassword.value ? Icons.visibility_off_outlined :
                                  Icons.visibility
                            )),
                    ),
                  );
                }
            ),
            SizedBox(height: height * .1,),
            RoundButton(
                title: 'Login',
                loading: authViewModel.loading,
                onPress: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter email", context);
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter password", context);
                  }else if(_passwordController.text.length<6){
                    Utils.flushBarErrorMessage("Please enter 6 digit password", context);
                  }else{
                    Map data = {
                      'email' : _emailController.text.toString(),
                      'password' : _passwordController.text.toString(),
                    };
                    // Map data = {
                    //   'email' : "eve.holt@reqres.in",
                    //   'password' : "cityslicka",
                    // };
                    authViewModel.loginApi(data, context);
                    print('api hit');
                  }
            },),
            SizedBox(height: height *.02,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.signUp);
              },
                child: const Text("Don't have an acocunt? Sign Up")),
          ],
        ),
      ),
    );
  }
}
