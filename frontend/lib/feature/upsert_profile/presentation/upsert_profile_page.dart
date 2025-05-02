import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/contract_method.dart';
import 'package:mptc_exercise_banhahuy/feature/home/presentation/bloc/category/category_bloc.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:mptc_exercise_banhahuy/widgets/custom_textfield.dart';

class UpsertProfilePage extends StatefulWidget {
  final Profile? profile;
  
  const UpsertProfilePage({
    Key? key, 
    this.profile,
  }) : super(key: key);

  @override
  State<UpsertProfilePage> createState() => _UpsertProfilePageState();
}

class _UpsertProfilePageState extends State<UpsertProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _roleController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _linkedInController = TextEditingController();
  final _githubController = TextEditingController();
  
  File? _imageFile;
  String? _photoUrl;
  List<Category> _selectedSkills = [];
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.profile != null;
    
    if (_isEditing) {
      _nameController.text = widget.profile?.name ?? '';
      _roleController.text = widget.profile?.role ?? '';
      _bioController.text = widget.profile?.bio ?? '';
      _photoUrl = widget.profile?.photoUrl;
      _selectedSkills = List<Category>.from(widget.profile?.skills ?? []);
      
      final contactMethod = widget.profile?.contractMethod;
      if (contactMethod != null) {
        _emailController.text = contactMethod.email ?? '';
        _linkedInController.text = contactMethod.linkedIn ?? '';
        _githubController.text = contactMethod.github ?? '';
      }
    }
    
    // Fetch categories if needed
    // context.read<CategoryBloc>().add(const FetchCategories());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _linkedInController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
        _photoUrl = null; // Clear the URL since we have a new file
      });
    }
  }

  void _toggleSkill(Category skill) {
    setState(() {
      if (_selectedSkills.any((s) => s.id == skill.id)) {
        _selectedSkills.removeWhere((s) => s.id == skill.id);
      } else {
        _selectedSkills.add(skill);
      }
    });
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) return;
    
    final contractMethod = ContractMethod(
      email: _emailController.text.trim(),
      linkedIn: _linkedInController.text.trim(),
      github: _githubController.text.trim(),
    );
    
    final profile = Profile(
      id: widget.profile?.id,
      name: _nameController.text.trim(),
      role: _roleController.text.trim(),
      photoUrl: _imageFile != null ? _imageFile!.path : _photoUrl,
      skills: _selectedSkills,
      bio: _bioController.text.trim(),
      contractMethod: contractMethod,
    );
    
    if (_isEditing) {
      context.read<ProfileBloc>().add(UpdateProfile(
        profile: profile,
        imageFile: _imageFile,
      ));
    } else {
      context.read<ProfileBloc>().add(AddProfile(
        profile: profile,
        imageFile: _imageFile,
      ));
    }
    
    // Navigate back after saving
    // context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? "Edit Profile" : "Add Profile"),
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: Text(
              "Save",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSaved) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Profile saved successfully")),
            );
            context.pop();
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileImageSection(),
                const SizedBox(height: 24),
                _buildBasicInfoSection(),
                const SizedBox(height: 24),
                _buildSkillsSection(),
                const SizedBox(height: 24),
                _buildContactSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImageSection() {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                image: _imageFile != null
                    ? DecorationImage(
                        image: FileImage(_imageFile!),
                        fit: BoxFit.cover,
                      )
                    : _photoUrl != null
                        ? DecorationImage(
                            image: NetworkImage(_photoUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
              ),
              child: (_imageFile == null && _photoUrl == null)
                  ? Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: Colors.grey[400],
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tap to change photo",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Basic Information",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D3748),
              ),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _nameController,
          label: "Full Name",
          hint: "Enter your full name",
          prefixIcon: Icons.person_outline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Name is required";
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _roleController,
          label: "Professional Role",
          hint: "e.g. Software Engineer, UX Designer",
          prefixIcon: Icons.work_outline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Role is required";
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _bioController,
          label: "Bio",
          hint: "Tell us about yourself",
          prefixIcon: Icons.description_outlined,
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skills",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D3748),
              ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: state.categories.map((skill) {
                  final isSelected = _selectedSkills.any((s) => s.id == skill.id);
                  return FilterChip(
                    label: Text(skill.name ?? ''),
                    selected: isSelected,
                    onSelected: (_) => _toggleSkill(skill),
                    backgroundColor: Colors.white,
                    selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    checkmarkColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Theme.of(context).primaryColor : Colors.grey[700],
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? Theme.of(context).primaryColor : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  );
                }).toList(),
              );
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2D3748),
              ),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _emailController,
          label: "Email",
          hint: "your.email@example.com",
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value != null && value.isNotEmpty) {
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(value)) {
                return "Please enter a valid email";
              }
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _linkedInController,
          label: "LinkedIn",
          hint: "linkedin.com/in/username",
          prefixIcon: Icons.link,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _githubController,
          label: "GitHub",
          hint: "github.com/username",
          prefixIcon: Icons.code,
        ),
      ],
    );
  }

  
}