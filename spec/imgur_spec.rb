require 'spec_helper'
require 'imgurapi'

describe Imgurapi do

  def file(name)
    File.open(name, 'r')
  end

  describe 'image management calls' do

    before(:all) do
      credentials = read_credentials_file
      @session = Imgurapi::Session.instance(credentials)
    end

    it 'returns my account information' do
      expect(@session.account.account).to be_an_instance_of Imgurapi::Account
    end

    it 'fails uploading an image' do
      expect { @session.image.image_upload('') }.to raise_error
    end

    it 'uploads and returns the number of images stored' do
      image = @session.image.image_upload(file('sample.jpg'))

      expect(@session.account.image_count).to be >= 1
    end

    it 'uploads and retrieves the image' do
      image_uploaded = @session.image.image_upload(file('sample2.jpg'))

      image_retrieved = @session.image.image image_uploaded.id

      expect(image_retrieved.id).to eq image_uploaded.id
    end

    it 'deletes the image' do
      image_uploaded = @session.image.image_upload(file('sample3.jpg'))
      id = image_uploaded.id

      expect(@session.image.image_delete(image_uploaded)).to be_truthy
      expect(@session.image.image id).to be_nil
    end
  end
end
