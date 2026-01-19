// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:nectar_beezeness/core/utils/utils.dart';

// class CacheKeys {
//   static const String userId = 'uid';
//   static const String loginToken = 'loginToken';
//   static const String companyToken = 'companyToken';
//   static const String companyId = 'companyId';
//   static const String companyUserId = 'companyUserId';
//   static const String companyEmployeeId = 'companyEmployeeId';
//   static const String companyUrl = 'companyUrl';
//   static const String hasUnfinishedTask = 'hasUnfinishedTask';
//   static const String appId = 'appId';
//   static const String userType = 'userType';
//   static const String userTypeName = 'userTypeName';
//   static const String company = 'company';
//   static const String userName = 'userName';
//   static const String userEmail = 'userEmail';
//   static const String individualQR = 'invidualQR';
//   static const String stripeSecret = 'stripeSecret';
//   static const String bKashToken = 'bKashToken';
//   static const String bKashPaymentId = 'bKashPaymentId';
//   static const String currency = 'currency';
//   static const String designationId = 'designationId';
//   static const String onboardingCompleted = 'onboardingCompleted';
//   static const String savedPaymentCards = 'savedPaymentCards';
//   static const String selectedPaymentCardId = 'selectedPaymentCardId';
// }

// /// Cache
// final cacheServiceProvider = Provider<CacheService>((ref) => CacheService());

// class CacheService {
//   CacheService() {
//     box = Hive.box(boxName);
//   }
//   late Box<dynamic> box;
//   static const String boxName = 'nectar';

//   Future<bool> save<T>(String key, T value) async {
//     try {
//       await box.put(key, value);
//       Log.info('Cache save success: key=$key value=$value');
//       return true;
//     } catch (e) {
//       Log.error('Error saving to cache: $e');
//       return false;
//     }
//   }

//   T? retrieve<T>(String key) {
//     try {
//       final value = box.get(key);
//       if (value != null && value is T) {
//         Log.info('Cache retrieve hit: key=$key value=$value');
//         return value;
//       }
//       Log.info('Cache retrieve miss or type mismatch for key=$key value=$value');
//       return null;
//     } catch (e) {
//       Log.error('Error retrieving from cache: $e');
//       return null;
//     }
//   }

//   Future<bool> delete(List<String> keys) async {
//     try {
//       await box.deleteAll(keys);
//       return true;
//     } catch (e) {
//       Log.error('Error deleting from cache: $e');
//       return false;
//     }
//   }

//   Future<bool> clear() async {
//     try {
//       await box.clear();
//       return true;
//     } catch (e) {
//       Log.error('Error clearing cache: $e');
//       return false;
//     }
//   }

//   bool hasKey(String key) {
//     return box.containsKey(key);
//   }

//   Future<void> dispose() async {
//     try {
//       await box.deleteFromDisk();
//     } catch (e) {
//       Log.error('Error disposing cache: $e');
//     }
//   }
// }

// class CacheNotifier<T> extends FamilyNotifier<T?, String> {
//   @override
//   T? build(String arg) {
//     return ref.watch(cacheServiceProvider).retrieve<T>(arg);
//   }

//   Future<bool> setValue(T value) async {
//     final success = await ref.read(cacheServiceProvider).save(arg, value);
//     if (success) {
//       state = value;
//     }
//     return success;
//   }

//   Future<bool> clearValue() async {
//     final success = await ref.read(cacheServiceProvider).delete([arg]);
//     if (success) {
//       state = null;
//     }
//     return success;
//   }
// }
