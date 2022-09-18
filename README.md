# zoom_clone

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

### Some resources that helped me while building this project

- [Some changes in podfile for firebase setup](https://stackoverflow.com/questions/72289521/swift-pods-cannot-yet-be-integrated-as-static-libraries-firebasecoreinternal-lib)
- [Android setup firebase](https://stackoverflow.com/questions/61807520/how-to-fix-error-no-signature-of-method-build-ap86oam3dut3pxce3x49rdtma-androi)
- [pod issue flutter](https://stackoverflow.com/questions/54135078/how-to-solve-error-running-pod-install-in-flutter-on-mac)
- [flutter-flutter-h-file](https://stackoverflow.com/questions/64973346/error-flutter-flutter-h-file-not-found-when-flutter-run-on-ios)
- [GoogleService-Info.plist file not found and clientId was not provided programmatically](https://stackoverflow.com/questions/73103392/googleservice-info-plist-file-not-found-and-clientid-was-not-provided-programmat)
- [No signature of method: .android() is applicable for argument types. Exception in build.gradle (app)](https://stackoverflow.com/questions/67418660/no-signature-of-method-android-is-applicable-for-argument-types-exception-i)
- [Mismatch Data type in kotlin -> JitsiMeetPlugin.kt: (66, 42)](https://github.com/gunschu/jitsi_meet/issues/393)

### Some tips i learned while building this project

- Always use  ```arch -x86_64 pod install```  instead of  ```pod install```  for ios after adding any package.

### Some project specific tips

- For ios, add these lines in podfile to make jitsi work:

```ruby
post_install do |installer| 
    installer.pods_project.targets.each do |target|
        flutter_additional_ios_build_settings(target)
        if target.name == 'flutter_zoom_plugin'
            target.build_configurations.each do |config|
                config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
            end
        end
    end
```

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
