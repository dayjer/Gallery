import UIKit
import Photos

extension UIImageView {

  func g_loadImage(_ asset: PHAsset) {
    guard frame.size != CGSize.zero else {
      image = GalleryBundle.image("gallery_placeholder")
      return
    }

    if tag == 0 {
      image = GalleryBundle.image("gallery_placeholder")
    } else {
      PHImageManager.default().cancelImageRequest(PHImageRequestID(tag))
    }

    let options = PHImageRequestOptions()
    options.isNetworkAccessAllowed = true

    let id = PHImageManager.default().requestImage(
      for: asset,
      targetSize: CGSize(width: frame.size.width*UIScreen.main.scale, height: frame.size.height*UIScreen.main.scale),
      contentMode: .aspectFill,
      options: options) { [weak self] image, _ in
      self?.image = image
    }
    
    tag = Int(id)
  }
}
