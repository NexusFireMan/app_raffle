import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../src/locale.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                Color(0xFFF7418C),
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
                AppLocalizations.of(context)?.translate('landing_title') ??
                    'Welcome to Raffle App',
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
                    AppLocalizations.of(context)?.translate('landing_guest') ??
                        'Guest',
                    'assets/icons/guest.svg',
                    '/guest',
                  ),
                  _buildButton(
                    context,
                    AppLocalizations.of(context)?.translate('landing_login') ??
                        'Log In',
                    'assets/icons/login.svg',
                    '/login',
                  ),
                  _buildButton(
                    context,
                    AppLocalizations.of(context)
                            ?.translate('landing_register') ??
                        'Register',
                    'assets/icons/register.svg',
                    '/register',
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                  AppLocalizations.of(context)?.translate('landing_contact') ??
                      'Contact Us',
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
