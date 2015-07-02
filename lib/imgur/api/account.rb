module Imgur
  module Api
    class Account < Base

      # https://api.imgur.com/endpoints/account#account
      def account
        Imgur::Account.new communication.call(:get, 'account/me')
      end

      # https://api.imgur.com/endpoints/account#images
      def images(page = 0)
        communication.call(:get, "account/me/images/#{page}").map do |image|
          Imgur::Image.new image
        end
      end

      # https://api.imgur.com/endpoints/account#image-count
      def image_count
        communication.call(:get, 'account/me/images/count')
      end
    end
  end
end
