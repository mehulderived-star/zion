import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

import '../constant/utilities.dart';

class BiometricAuthUtil {
  static final LocalAuthentication _auth = LocalAuthentication();

  // Helper to show a SnackBar
  static void _showSnackBar(BuildContext context, String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  // Check if device supports biometric authentication
  static Future<bool> isBiometricAvailable() async {
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      bool canAuthenticate = await _auth.isDeviceSupported();
      return canCheckBiometrics && canAuthenticate;
    } catch (e) {
      return false;
    }
  }

  // Get list of available biometric types
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  // Authenticate user
  static Future<bool> authenticateUser(
    BuildContext context, {
    String localizedReason = 'Authenticate to access the app',
    bool biometricOnly = false,
    bool stickyAuth = false,
    Function? onFallback,
  }) async {
    try {
      // Check if biometrics/device security is supported
      bool isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        // _showSnackBar(
        //     context, 'No biometric/device security available on this device');
        showErrorToast("No biometric/device security available on this device");
        if (onFallback != null) onFallback();
        return false;
      }

      // Attempt authentication
      final bool authenticated = await _auth.authenticate(
        localizedReason: localizedReason,
        options: AuthenticationOptions(
          stickyAuth: stickyAuth,
          biometricOnly: biometricOnly,
        ),
      );

      // Handle authentication result
      if (authenticated) {
        // _showSnackBar(context, 'Authentication successful');
        // showSuccessToast("Authentication successful");
      } else {
        // _showSnackBar(context, 'Authentication cancelled or failed');
        showSuccessToast("Authentication cancelled or failed");
        if (onFallback != null) onFallback();
      }

      return authenticated;
    } on PlatformException catch (e) {
      // _showSnackBar(context, 'Error: ${e.message}');
      return false;
    } catch (e) {
      // _showSnackBar(context, 'Error: ${e.toString()}');
      return false;
    }
  }
}
