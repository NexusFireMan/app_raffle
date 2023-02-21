import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../src/locale.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var lan = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFBAB66),
                Color.fromARGB(255, 255, 136, 32),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: size.width * 0.9,
              ),
              const SizedBox(height: 50),
              Text(
                lan!.translate('landing_title'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(
                    context,
                    lan.translate('landing_guest'),
                    'assets/icons/guest.svg',
                    '/guest',
                  ),
                  _buildButton(
                    context,
                    lan.translate('landing_login'),
                    'assets/icons/login.svg',
                    '/login',
                  ),
                  _buildButton(
                    context,
                    lan.translate('landing_register'),
                    'assets/icons/register.svg',
                    '/register',
                  ),
                ],
              ),
              //const SizedBox(height: 20),
              const Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: () => {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  ),
                ),
                child: Text(
                  lan.translate('landing_contact'),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String label, String image, String route) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: size.width * 0.25,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: 50,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
