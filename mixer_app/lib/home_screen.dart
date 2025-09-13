import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String? selectedAge;
  String? selectedHeight;
  String? selectedHabit;
  bool isFilterSelected = false;

  final List<String> ageOptions = ['18', '19', '20', '21', '22', '23'];
  final List<String> heightOptions = [
    '5\'1',
    '5\'2',
    '5\'3',
    '5\'4',
    '5\'6',
    '5\'7',
  ];
  final List<String> habitOptions = ['Reading', 'Swimming'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header with Mixer text and icons
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mixer',
                    style: TextStyle(
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth * 0.06,
                      height: 1.0,
                      letterSpacing: -0.06,
                      color: const Color(0xFF22242B),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.09,
                        height: screenWidth * 0.09,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF5E1053),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.flash_on,
                          color: const Color(0xFF5E1053),
                          size: screenWidth * 0.05,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Container(
                        width: screenWidth * 0.09,
                        height: screenWidth * 0.09,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF5E1053),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: const Color(0xFF5E1053),
                          size: screenWidth * 0.05,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // horizontal scrollable filter section
            SizedBox(
              height: screenHeight * 0.05,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  children: [
                    _buildFilterButton(
                      'Filters',
                      Icons.tune,
                      !isFilterSelected,
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    _buildDropdown('Age', selectedAge, ageOptions, (value) {
                      setState(() {
                        selectedAge = value;
                        isFilterSelected = true;
                      });
                    }),
                    SizedBox(width: screenWidth * 0.03),
                    _buildDropdown('Height', selectedHeight, heightOptions, (
                      value,
                    ) {
                      setState(() {
                        selectedHeight = value;
                        isFilterSelected = true;
                      });
                    }),
                    SizedBox(width: screenWidth * 0.03),
                    _buildDropdown('Habits', selectedHabit, habitOptions, (
                      value,
                    ) {
                      setState(() {
                        selectedHabit = value;
                        isFilterSelected = true;
                      });
                    }),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProfileImages(),
                    SizedBox(height: screenHeight * 0.03),
                    _buildTextContent(),
                    SizedBox(height: screenHeight * 0.02),
                    _buildAdjustLocationButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFilterButton(String text, IconData icon, bool isSelected) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth * 0.09,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.02,
      ),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFFF6FE) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF5E1053) : const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: screenWidth * 0.04,
            color: isSelected
                ? const Color(0xFF5E1053)
                : const Color(0xFF6B7280),
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.04,
              height: 1.25,
              color: isSelected
                  ? const Color(0xFF5E1053)
                  : const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String? selectedValue,
    List<String> options,
    Function(String?) onChanged,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isThisDropdownSelected = selectedValue != null;

    return Container(
      height: screenWidth * 0.10,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.02,
      ),
      decoration: BoxDecoration(
        color: isThisDropdownSelected ? const Color(0xFFFFF6FE) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isThisDropdownSelected
              ? const Color(0xFF5E1053)
              : const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(
            label,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.04,
              height: 1.25,
              color: isThisDropdownSelected
                  ? const Color(0xFF5E1053)
                  : const Color(0xFF6B7280),
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: screenWidth * 0.04,
            color: isThisDropdownSelected
                ? const Color(0xFF5E1053)
                : const Color(0xFF6B7280),
          ),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                  height: 1.25,
                  color: const Color(0xFF5E1053),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildProfileImages() {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Stack(
        children: [
          // Man 1 image
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: 10,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFFFFC5CA),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset('assets/Man1.png', fit: BoxFit.cover),
              ),
            ),
          ),
          // Girl 2 image
          Positioned(
            right: MediaQuery.of(context).size.width * 0.25,
            top: 10,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFFFFDAA3),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset('assets/Girl2.png', fit: BoxFit.cover),
              ),
            ),
          ),
          // Girl 1 image
          Positioned(
            left: MediaQuery.of(context).size.width * 0.5 - 50,
            top: 0,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFFF6E5F4),
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(color: Color(0xFFFFFFFF), width: 2.59),
                ),
              ),
              child: ClipOval(
                child: Image.asset('assets/Girl1.png', fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final mainText = isFilterSelected
        ? "You've seen them all"
        : "You've seen everyone nearby";
    final subText = isFilterSelected
        ? "No more profiles match your filters. Update your preferences to find more people."
        : "No more profiles in your area. Check back later or expand your location to see more people.";

    return Column(
      children: [
        Text(
          mainText,
          style: TextStyle(
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 0.05,
            height: 1.3,
            letterSpacing: -0.02,
            color: const Color(0xFF22242B),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenWidth * 0.04),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Text(
            subText,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.04,
              height: 1.5,
              letterSpacing: -0.02,
              color: const Color(0xFF6E6F73),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildAdjustLocationButton() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.5,
      height: screenWidth * 0.11,
      decoration: BoxDecoration(
        color: const Color(0xFF5E1053),
        borderRadius: BorderRadius.circular(39),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(39),
          child: Center(
            child: Text(
              'Adjust Location',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.04,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screenHeight * 0.12,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.radar, 'Mixer'),
          _buildNavItem(1, null, 'Your Mix', 'assets/Mixer_Normal.png'),
          _buildNavItem(2, Icons.event, 'Events'),
          _buildNavItem(3, Icons.visibility_outlined, 'View'),
          _buildNavItem(4, Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData? icon,
    String label, [
    String? imagePath,
  ]) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: screenWidth * 0.11,
        height: screenWidth * 0.11,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF6E5F4) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath,
                width: screenWidth * 0.06,
                height: screenWidth * 0.055,
                color: isSelected
                    ? const Color(0xFF5E1053)
                    : const Color(0xFF6B7280),
              )
            else
              Icon(
                icon,
                size: screenWidth * 0.06,
                color: isSelected
                    ? const Color(0xFF5E1053)
                    : const Color(0xFF6B7280),
              ),
          ],
        ),
      ),
    );
  }
}
