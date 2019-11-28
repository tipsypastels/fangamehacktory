module ApplicationRecord::HasOneAttachedWithDefault
  extend ActiveSupport::Concern

  included do
    include Rails.application.routes.url_helpers
  end

  class_methods do
    def has_one_attached_with_default(name, location:)
      has_one_attached name
      after_create :"set_default_#{name}"

      define_method :"set_default_#{name}" do |force: false|
        return if send(name).attached? && !force
        
        location = instance_exec(&location) if location.is_a?(Proc)
        location = Rails.root.join("app/assets/images/#{location}")

        send(name).attach(
          io: File.open(location),
          filename: "__#{name}__.pdf",
        )
      end

      define_method :"#{name}_url" do
        if send(name).attached?
          rails_blob_path(send(name), disposition: 'attachment', only_path: true)
        end
      end

      define_method :"customized_#{name}_url" do
        send(:"#{name}_url") if send(:"#{name}_changed?")
      end

      define_method :"#{name}_changed?" do
        return false unless send(name).attached?
        send(name).filename.to_s != "__#{name}__.pdf"
      end
    end
  end
end