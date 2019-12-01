module ApplicationRecord::HasOneAttachedSmart
  extend ActiveSupport::Concern

  included do
    include Rails.application.routes.url_helpers
  end

  class_methods do
    def has_one_attached_smart(name, &block)
      has_one_attached name

      alias_method :"real_#{name}", name

      if block
        define_method name do
          send("real_#{name}") || instance_eval(&block)
        end
      end

      define_method :"#{name}_url" do
        if send(name).attached?
          rails_blob_path(send(name), disposition: 'attachment', only_path: true)
        end
      end
    end
  end
end