module ProductsHelper
  def default_image(image)
    return image unless image.file.nil?

    'https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg'
  end
end
