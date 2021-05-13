import UIKit

public struct Country {
    public let flagAsset: UIImage
    public let name: String
	public let isUppercase: Bool

	public init(flagAsset: UIImage, name: String, isUppercased: Bool) {
        self.flagAsset = flagAsset
		self.isUppercase = isUppercased
		if (isUppercased == true) {
			self.name = name.uppercased()
		} else {
			self.name = name
		}
    }
}
