// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../home_screen.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isVipSelected = false;

  // colors for different plans
  ColorScheme get _colorScheme =>
      isVipSelected ? _vipColorScheme : _normalColorScheme;

  static const ColorScheme _normalColorScheme = ColorScheme(
    primary: Color(0xFF8B5CF6),
    secondary: Color.fromARGB(255, 255, 182, 219),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFEFEFE),
    error: Color(0xFFEF4444),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1F2937),
    onBackground: Color(0xFF1F2937),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  static const ColorScheme _vipColorScheme = ColorScheme(
    primary: Color(0xFFD97706),
    secondary: Color(0xFFB45309),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFEFEFE),
    error: Color(0xFFEF4444),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1F2937),
    onBackground: Color(0xFF1F2937),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
  );

  LinearGradient get _backgroundGradient => isVipSelected
      ? const LinearGradient(
          colors: [Color(0xFFFFF4E4), Color(0xFFFFFEFE)],
          begin: Alignment.topCenter,
          stops: [0.0, 0.3],
          end: Alignment.bottomCenter,
        )
      : const LinearGradient(
          colors: [Color(0xFFFFF0F8), Color(0xFFFFFEFE)],
          begin: Alignment.topCenter,
          stops: [0.0, 0.3],
          end: Alignment.bottomCenter,
        );

  LinearGradient get _continueButtonGradient => isVipSelected
      ? const LinearGradient(
          colors: [Color(0xFFD59331), Color(0xFFA96F18)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
      : const LinearGradient(
          colors: [Color(0xFF880078), Color.fromARGB(213, 229, 0, 4)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );

  Color get _featuresBorderColor =>
      isVipSelected ? const Color(0xFFFFE5BE) : const Color(0xFFEAB8CB);

  Color get _checkmarkColor =>
      isVipSelected ? const Color(0xFFBB6F00) : const Color(0xFF5E1053);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: _backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.025,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mixer',
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Onest',
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close,
                        size: screenWidth * 0.06,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.04),

                Text(
                  'Level Up Your Mixer Experience',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Manrope',
                    color: const Color(0xFF5E1053),
                    height: 1.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.08),

                Text(
                  'Select a plan',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Manrope',
                    color: const Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Normal plan card
                Row(
                  children: [
                    Expanded(
                      child: _buildPlanCard(
                        title: 'Mixer',
                        price: '\$24.99',
                        isVipPlan: false,
                        description: 'All of the below',
                        isSelected: !isVipSelected,
                        fontFamily: 'Manrope',
                        iconPath: 'assets/Mixer_Normal.png',
                        onTap: () => setState(() => isVipSelected = false),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.18,
                        logoSize: screenWidth * 0.09,
                        logoTop: screenHeight * 0.015,
                        logoLeft: screenWidth * 0.3,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    // VIP plan Card
                    Expanded(
                      child: _buildPlanCard(
                        title: 'Mixer VIP',
                        price: '\$99.99',
                        isVipPlan: true,
                        description: isVipSelected
                            ? 'Mixer + VIP seating, food & beverages'
                            : 'All 3 + VIP seating, food, and beverages',
                        isSelected: isVipSelected,
                        fontFamily: 'Manrope',
                        iconPath: 'assets/Mixer_VIP.png',
                        onTap: () => setState(() => isVipSelected = true),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.18,
                        logoSize: screenWidth * 0.095,
                        logoTop: screenHeight * 0.015,
                        logoLeft: screenWidth * 0.295,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),

                _buildFeaturesSection(),
                const Spacer(),

                _buildContinueButton(),
                SizedBox(height: screenHeight * 0.02),

                // Terms text
                Text(
                  'By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer\'s Terms.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.025,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Manrope',
                    color: const Color(0xFF6E6F73),
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String description,
    required bool isSelected,
    required String fontFamily,
    required String iconPath,
    required VoidCallback onTap,
    required double width,
    required double height,
    required double logoSize,
    required double logoTop,
    required double logoLeft,
    required bool isVipPlan,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    Color borderColor;
    if (isSelected) {
      borderColor = isVipPlan ? _colorScheme.primary : const Color(0xFFEAB8CB);
    } else {
      borderColor = const Color(0xFFE5E7EB);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Positioned(
              top: logoTop,
              left: logoLeft,
              child: Image.asset(iconPath, width: logoSize, height: logoSize),
            ),

            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope',
                      color: isVipSelected
                          ? const Color(0xFFA16000)
                          : const Color(0xFF5E1053),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: const Color(0xFF44464B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final features = isVipSelected
        ? [
            'Unlimited Likes',
            'See who liked you',
            'Find people with wide range',
            'Access to events',
            'VIP seating, food & beverages',
          ]
        : [
            'Unlimited Likes',
            'See who liked you',
            'Find people with wide range',
            'Access to events',
          ];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(top: screenWidth * 0.025),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: _featuresBorderColor, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenWidth * 0.02),
                ...features.map(
                  (feature) => Padding(
                    padding: EdgeInsets.only(bottom: screenWidth * 0.03),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: _checkmarkColor,
                          size: screenWidth * 0.05,
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: Text(
                            feature,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontFamily: 'Manrope',
                              color: const Color(0xFF1F2937),
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
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenWidth * 0.015,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: _featuresBorderColor, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Included with Mixer VIP',
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Manrope',
                  color: const Color(0xFF1F2937),
                  height: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    final screenWidth = MediaQuery.of(context).size.width;
    final price = isVipSelected ? '\$99.99' : '\$24.99';

    return Container(
      width: screenWidth * 0.9,
      height: screenWidth * 0.12,
      decoration: BoxDecoration(
        gradient: _continueButtonGradient,
        borderRadius: BorderRadius.circular(39),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Navigate to home screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          borderRadius: BorderRadius.circular(39),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.13,
              screenWidth * 0.028,
              screenWidth * 0.13,
              screenWidth * 0.028,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isVipSelected
                      ? 'assets/Mixer_VIP.png'
                      : 'assets/Mixer_Normal.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  color: Colors.white,
                ),
                SizedBox(width: screenWidth * 0.025),
                Text(
                  'Continue - $price total',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Manrope',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
