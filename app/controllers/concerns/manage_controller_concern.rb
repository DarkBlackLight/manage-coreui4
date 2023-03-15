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
  end
end