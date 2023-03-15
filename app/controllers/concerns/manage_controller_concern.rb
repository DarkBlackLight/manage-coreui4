module ManageControllerConcern
  extend ActiveSupport::Concern
  included do
    layout 'manage/application'
    before_action :setup_config

    private

    def setup_config
      @config = {
        scope: 'manage',
        routes: [

        ]
      }
    end

    def manage_text_tag(label, name, value, options = {})
      options[:class] = "#{options[:class]} form-control"
      manage_tag = (text_field_tag name, value, options)
      tag.div class: 'form-group' do
        (label ? ((label_tag label) + manage_tag) : manage_tag)
      end
    end
  end
end