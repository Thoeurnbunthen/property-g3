import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Ra Jessika');
  final _usernameController = TextEditingController(text: 'jessika');
  final _emailController = TextEditingController(text: 'jesssi@gmail.com');
  final _dateOfBirthController = TextEditingController(text: '01/01/1990');
  final _phoneController = TextEditingController(text: '098 834 752 90');

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _dateOfBirthController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
      Navigator.pop(context);
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF0D2B45),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/profile_pic.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                _buildTextField(
                  label: 'Full Name',
                  controller: _nameController,
                  hintText: 'Your full name',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'User Name',
                  controller: _usernameController,
                  hintText: 'Your username',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Email',
                  controller: _emailController,
                  hintText: 'Your email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r"^[^@\s]+@[^@\s]+\.[^@\s]+").hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Date of birth',
                  controller: _dateOfBirthController,
                  hintText: 'Your birth date',
                  keyboardType: TextInputType.datetime,
                  suffixIcon: const Icon(Icons.calendar_today),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Phone number',
                  controller: _phoneController,
                  hintText: 'phone number',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveChanges,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFF0D2B45),
                    ),
                    child: const Text(
                      'Save Change',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
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
