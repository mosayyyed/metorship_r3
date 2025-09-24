import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_theme.dart';

// Model class (temporary - should be moved to data layer)
class CharacterModel {
  final String name;
  final String animeName;
  final String imagePath;

  CharacterModel({
    required this.name,
    required this.animeName,
    required this.imagePath,
  });
}

class TopCharactersSection extends StatelessWidget {
  final List<CharacterModel> characters;
  final Function(CharacterModel)? onCharacterTap;

  const TopCharactersSection({
    super.key,
    required this.characters,
    this.onCharacterTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'Top Characters',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          // Characters List
          SizedBox(
            height: 143.h, // character circle + name + anime name
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: characters.length,
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) {
                final character = characters[index];
                return SizedBox(
                  width: 92.w,
                  child: _buildCharacterCard(character),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterCard(CharacterModel character) {
    return GestureDetector(
      onTap: () => onCharacterTap?.call(character),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Character Circle Image
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(
              child: Image.asset(
                character.imagePath,
                width: 84,
                height: 84,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 84,
                    height: 84,
                    color: AppTheme.backgroundColor,
                    child: Icon(
                      Icons.person,
                      color: AppTheme.primaryColor,
                      size: 30.sp,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8.h),
          // Character Name
          Text(
            character.name,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.secondaryColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          // Anime Name
          Text(
            character.animeName,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppTheme.secondaryColor.withOpacity(0.7),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
