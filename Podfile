platform :ios, '13.0'

def shared_pods
   pod 'FirebaseAuth'
end

target 'Smart Home' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Smart Home

  target 'SmartHomeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  shared_pods

  # pod 'FirebaseMessaging'
  pod 'GoogleAnalytics'
  pod 'FirebaseFirestore'
  pod 'FirebaseFunctions'
  pod 'Charts'

end

target 'SmartHomeUITests' do
    shared_pods
end