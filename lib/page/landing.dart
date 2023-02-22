import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../src/locale.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Translate var
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
                Color(0xFFEA9937),
                Color(0xFFEA3C12),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image for heading
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: size.width * 0.9,
                ),
              ),
              // Heading space
              const SizedBox(height: 50),
              // Title for landing
              Text(
                lan!.translate('landing_title'),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 50),
              // Row for button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Button guest
                  _buildButton(
                    context,
                    lan.translate('landing_guest'),
                    'assets/icons/guest.svg',
                    '/guest',
                  ),
                  // Button Login
                  _buildButton(
                    context,
                    lan.translate('landing_login'),
                    'assets/icons/login.svg',
                    '/login',
                  ),
                  // Buton register
                  _buildButton(
                    context,
                    lan.translate('landing_register'),
                    'assets/icons/register.svg',
                    '/register',
                  ),
                ],
              ),
              // Expand body
              const Expanded(child: SizedBox()),
              // Button for contact us
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
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              // Separated
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Construct for button
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
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
