clean:
	@flutter clean && rm ios/Podfile.lock pubspec.lock && rm -rf ios/Pods ios/Runner.xcworkspace

runner:
	@flutter pub run build_runner watch --delete-conflicting-outputs

vm-runner:
	@fvm flutter pub run build_runner watch --delete-conflicting-outputs

build-android:
	@flutter build appbundle