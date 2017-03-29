require_relative 'android_verification'

class PurchaseVerification
  IOS_PLATFORM = 'ios'.freeze
  ANDROID_PLATFORM = 'android'.freeze

  def initialize(receipt, platform)
    @receipt = receipt
    @platform = platform
  end

  def package_name
    @receipt.fetch('packageName', nil)
  end

  def product_id
    @receipt.fetch('productId', nil)
  end

  def purchase_token
    @receipt.fetch('purchaseToken', nil)
  end

  def verify
    if @platform == IOS_PLATFORM
      Venice::Receipt.verify(@receipt)
    elsif @platform == ANDROID_PLATFORM
      AndroidVerification.new(package_name, product_id, purchase_token).verify
    end
  end
end
