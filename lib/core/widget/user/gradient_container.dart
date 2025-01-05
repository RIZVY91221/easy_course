import 'dart:convert';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final String bgColor;
  final String text;

  const GradientContainer({
    Key? key,
    required this.bgColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Decode the JSON field (only if it's not already a decoded object)
    Map<String, dynamic>? decodedBgColor;
    try {
      // Only decode bgColor if it's a JSON-encoded string
      decodedBgColor = _isJsonString(bgColor) ? json.decode(bgColor) : json.decode('{"backgroundImage":"$bgColor"}');
    } catch (e) {
      debugPrint("Error decoding bgColor JSON: $e");
      return _buildFallbackContainer("Invalid JSON format");
    }

    // Extract the backgroundImage
    String? backgroundImage = decodedBgColor?['backgroundImage'];
    if (backgroundImage == null || backgroundImage.isEmpty) {
      debugPrint("Missing or empty 'backgroundImage' field in JSON");
      return _buildFallbackContainer("No background image provided");
    }

    // Parse gradient colors
    List<Color> colors = _parseGradientColors(backgroundImage);
    if (colors.isEmpty || colors.first == Colors.grey) {
      debugPrint("Invalid gradient definition: $backgroundImage");
      return _buildFallbackContainer("Invalid gradient format");
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  // Helper function to check if a string is a valid JSON string
  bool _isJsonString(String str) {
    try {
      json.decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Helper function to parse gradient colors
  List<Color> _parseGradientColors(String backgroundImage) {
    debugPrint("Parsing backgroundImage: $backgroundImage");

    if (!backgroundImage.startsWith("linear-gradient")) {
      return [Colors.grey]; // Default color if invalid gradient
    }

    // Extract the color values inside the parentheses (ignoring angle and percentage)
    final gradientRegex = RegExp(r'linear-gradient\(([^)]+)\)');
    final match = gradientRegex.firstMatch(backgroundImage);

    if (match != null) {
      final gradientDefinition = match.group(1)!;

      // First, split by comma but preserve the RGB color components only
      final components = gradientDefinition.split(',').map((component) => component.trim()).toList();

      // Remove any non-color parts (like angle, percentages)
      final colorValues = components.where((c) => c.startsWith("rgb(") || c.startsWith("rgba(")).toList();

      debugPrint("Extracted colors: $colorValues");

      return colorValues.map((color) {
        // Convert "rgb(r, g, b)" or "rgba(r, g, b, a)" to Flutter's Color
        final rgbRegex = RegExp(r'rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+\.?\d*))?\)');
        final rgbMatch = rgbRegex.firstMatch(color);

        if (rgbMatch != null) {
          int r = int.parse(rgbMatch.group(1)!);
          int g = int.parse(rgbMatch.group(2)!);
          int b = int.parse(rgbMatch.group(3)!);
          // For rgba, the alpha value (opacity) can be extracted as well
          double alpha = rgbMatch.group(4) != null
              ? double.parse(rgbMatch.group(4)!)
              : 1.0; // Default alpha value is 1.0 (fully opaque)

          // Use alpha if available
          return Color.fromRGBO(r, g, b, alpha);
        }

        return Colors.grey; // Default color if parsing fails
      }).toList();
    }

    return [Colors.grey]; // Default color if no match
  }

  // Helper function to build fallback container
  Widget _buildFallbackContainer(String errorMessage) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
