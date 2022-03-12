class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :email, :name, :avatar, :category, :status, :phone, :gender, :dob

  def avatar
    if object.avatar.attached?
      {
        # url: rails_blob_url(object.avatar)
        url: url_for(object.avatar)
      }
    end
  end
end
