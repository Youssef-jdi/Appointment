platform :ios, '11.0'
#use_frameworks!

# ignore all warnings from all pods

inhibit_all_warnings!

def shared_pods
  use_frameworks!
  
  # Ignore all pod warnings
  inhibit_all_warnings!
  
  # Pods

  #Project Utilities
  pod 'SwiftLint'
  pod 'R.swift'
  pod 'Wormholy', :configurations => ['Debug']

  # Dependency Injection
  pod 'Swinject', '~> 2.6.2'
  pod 'SwinjectStoryboard'
  pod 'SwinjectAutoregistration'
  
  # Networking
  pod 'Moya', '~> 12.0'
  pod 'p2.OAuth2', '~> 4.2'
  
  # Firebase
  pod 'Firebase/Core'
  pod 'Firebase/DynamicLinks'

  # Sync related
  pod 'FBSDKCoreKit'
  pod 'FBSDKLoginKit'
  pod 'GoogleSignIn'

  pod 'RxSwift'
  
  pod 'Nuke'
  pod 'lottie-ios' #splash animation
  pod 'MaterialComponents/Buttons' #floating buttons
  pod 'SideMenuSwift'
  pod "Connectivity"
  pod 'M13Checkbox'

  
  # Chat Related Pods
  #pod 'MessageKit'

  
end

target 'appointment' do
  use_frameworks!
  shared_pods
  
end

target 'appointmentTests' do
  inherit! :search_paths
  shared_pods
  
  # Pods for testing
  pod 'SnapshotTesting'
  pod 'SwiftyMocky'
  pod 'Nimble'

end
