module ManageResourcesConcern
  extend ActiveSupport::Concern
  included do

    before_action :set_model
    before_action :set_resource, only: [:show, :edit, :update, :destroy]

    load_and_authorize_resource
    check_authorization

    def index
      @resources_all = @model.accessible_by(current_ability, :read).filterable(filter_params)
      set_includes
      @resources = @resources_all.order(index_order_by).page(params[:page]).per(params[:page_size] ? params[:page_size] : 10)
      @can_create = true
      @can_action = true
      @actions = true
      if params[:count_period] && params[:count_period_field] && params[:count_period_last]
        respond_to do |format|
          format.json { render json: { data: @resources_all.group_by_period(params[:count_period], params[:count_period_field], last: params[:count_period_last]).count } }
        end
      else
        respond_to do |format|
          format.html
          format.xlsx
          format.json { render json: index_json }
        end
      end
    end

    def show
      respond_to do |format|
        format.html
        format.json { render json: show_json }
      end
    end

    def new
      @resource = @model.new
    end

    def edit
    end

    def create
      @resource = @model.new(resource_params)
      if @resource.save
        flash[:success] = "#{t 'manage.resources.create_success'} #{@model.model_name.human}"
        render json: create_json, status: :ok
      else
        render json: { data: @resource.errors.full_messages.first }, status: :unprocessable_entity
      end
    end

    def update
      if @resource.update(resource_params)
        flash[:success] = "#{t 'manage.resources.update_success'} #{@model.model_name.human}"
        render json: update_json, status: :ok
      else
        render json: { data: @resource.errors.full_messages.first }, status: :unprocessable_entity
      end
    end

    def destroy
      @resource.destroy
      respond_to do |format|
        flash[:success] = "#{t 'manage.resources.destroy_success'} #{@model.model_name.human}"
        format.html { redirect_to destroy_success_path, notice: 'Resource was successfully destroyed.' }
        format.json { render json: destroy_json }
      end
    end

    private

    def set_model
      @model = controller_name.classify.constantize
      @model_name = controller_name.classify.downcase
    end

    def set_resource
      @resource = @model.find(params[:id])
    end

    def set_includes
      @resources_all = @resources_all
    end

    def filter_params
      params.slice
    end

    def show_json(resource = @resource)
      { data: resource.as_json }
    end

    def index_json
      { data: show_json(@resources), total: @resources_all.size }
    end

    def index_order_by
      @model.table_name + '.updated_at desc'
    end

    def create_json
      { data: create_success_path }
    end

    def update_json
      { data: update_success_path }
    end

    def destroy_json
      { data: destroy_success_path }
    end

    def create_success_path
      url_for({ action: :show, id: @resource.id })
    end

    def update_success_path
      url_for({ action: :show, id: @resource.id })
    end

    def destroy_success_path
      url_for({ action: :index })
    end
  end
end

