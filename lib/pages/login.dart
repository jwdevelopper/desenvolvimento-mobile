import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app_teste/pages/home.dart';
import 'package:my_app_teste/pages/registrar_usuario.dart';
import 'package:my_app_teste/services/login_service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailControler = new TextEditingController();
  TextEditingController _senhaControler = new TextEditingController();

  final _loginService = new LoginService();

  bool _isLoading = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.2), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailControler.dispose();
    _senhaControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 12, 2, 61),
                  const Color.fromARGB(255, 42, 3, 142),
                  Color.fromARGB(255, 2, 27, 139),
                  const Color.fromARGB(255, 13, 11, 151),
                ],
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/img/logo_v1.png",
                            height: 175.0,
                            width: 175.0,
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _emailControler,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: const Color.fromARGB(
                                    255,
                                    119,
                                    119,
                                    119,
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              labelText: "E-mail",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.user,
                                  color: Colors.black,
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _emailControler.clear();
                                },
                                icon: FaIcon(
                                  FontAwesomeIcons.xmark,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Informe o e-mail";
                              } else if (!value.contains('@')) {
                                return "Informe um e-mail válido!";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _senhaControler,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              labelText: "Senha",
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: const Color.fromARGB(
                                    255,
                                    119,
                                    119,
                                    119,
                                  ),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: FaIcon(FontAwesomeIcons.lock),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: FaIcon(
                                  _obscureText
                                      ? FontAwesomeIcons.eyeSlash
                                      : FontAwesomeIcons.eye,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Informe a senha";
                              } else if (value.length < 6) {
                                return "A senha deve conter mais de 5 digitos!";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegistrarUsuario(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Não Possuí Cadastro? Clique Aqui!",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          SizedBox(
                            height: 40.0,
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _isLoading
                                  ? null
                                  : () async {
                                      if (!_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "Por favor verifique o formulário!",
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      } else {
                                        setState(() {
                                          _isLoading = true;
                                        });
                                        print(_emailControler.text);
                                        print(_senhaControler.text);
                                        var response = await _loginService
                                            .efetuarLogin(
                                              _emailControler.text,
                                              _senhaControler.text,
                                            );
                                        if (response.message == null ||
                                            response.message!.isEmpty) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Login realizado com sucesso!",
                                              ),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "Erro ao efetuar login: ${response.message}",
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                        await Future.delayed(
                                          Duration(seconds: 5),
                                        );
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    },
                              label: Text("Logar"),
                              icon: Icon(Icons.login),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
