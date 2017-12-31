Pod::Spec.new do |s|
  s.name          = "DKImagePickerController"
  s.version       = "4.0.0-beta"
  s.summary       = "DKImagePickerController is a highly customizable, pure-Swift library."
  s.homepage      = "https://github.com/zhangao0086/DKImagePickerController"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "Bannings" => "zhangao0086@gmail.com" }
  s.platform      = :ios, "8.0"
  s.source        = { :git => "https://github.com/zhangao0086/DKImagePickerController.git", 
                     :tag => s.version.to_s }
  
  s.requires_arc  = true

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

  s.subspec 'Core' do |core|
    core.dependency 'DKImagePickerController/ImageDataManager'
    core.dependency 'DKImagePickerController/Resource'

    core.frameworks    = "Foundation", "UIKit", "Photos"

    core.source_files = "DKImagePickerController/*.{h,swift}", "DKImagePickerController/View/**/*.swift"
  end

  s.subspec 'ImageDataManager' do |image|
    image.source_files = "DKImageDataManager/**/*.swift"
  end

  s.subspec 'Resource' do |resource|
    resource.resource = "DKImagePickerController/Resource/DKImagePickerController.bundle"

    resource.source_files = "DKImagePickerController/Resource/DKImagePickerControllerResource.swift"
  end

  s.subspec 'PhotoGallery' do |gallery|
    gallery.dependency 'DKImagePickerController/Core'
    gallery.dependency 'DKPhotoGallery'

    gallery.source_files = "Extensions/DKImageExtensionGallery.swift"
  end

  s.subspec 'Camera' do |camera|
    camera.dependency 'DKImagePickerController/Core'
    camera.dependency 'DKCamera', '1.5.1'

    camera.source_files = "Extensions/DKImageExtensionCamera.swift"
  end

  s.subspec 'InlineCamera' do |inlineCamera|
    inlineCamera.dependency 'DKImagePickerController/Core'
    inlineCamera.dependency 'DKCamera', '1.5.1'

    inlineCamera.source_files = "Extensions/DKImageExtensionInlineCamera.swift"
  end

  s.subspec 'PhotoEditor' do |photoEditor|
    photoEditor.dependency 'DKImagePickerController/Core'
    photoEditor.dependency 'CLImageEditor', '0.2.0'

    photoEditor.source_files = "Extensions/DKImageExtensionPhotoEditor.swift"
  end

end
