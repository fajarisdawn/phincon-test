# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'PhinconPokemon' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  def ui
    pod 'SkeletonView', :git => 'https://github.com/Juanpe/SkeletonView', :tag => '1.8.2'
    pod 'NVActivityIndicatorView'
  end

  def utilities
    pod 'Kingfisher', '~> 6.3.1'
  end

  # Pods for PhinconPokemon

  ui
  utilities

  target 'PhinconPokemonTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PhinconPokemonUITests' do
    # Pods for testing
  end

end
