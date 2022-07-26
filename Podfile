# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'AppPass' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for AppPass
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxAlamofire'
  pod 'Alamofire'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Kingfisher'
  pod 'IQKeyboardManagerSwift'
  pod 'SVProgressHUD'
  pod 'Toaster'
  # pod 'Localize-Swift'
  pod 'ReachabilitySwift'
  
  # Quality + Generation
  pod 'SwiftLint'
  pod 'R.swift'
  pod 'CocoaDebug', :configurations => ['Debug']
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
    end
  end
end
