<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  include Trailblazer::Operation::Controller

  respond_to :html, :json

  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

  # GET <%= route_url %>/1
  def show
    present <%= class_name %>::Update
  end

  # GET <%= route_url %>/new
  def new
    form <%= class_name %>::Create
  end

  # GET <%= route_url %>/1/edit
  def edit
    form <%= class_name %>::Update

    render action: :edit
  end

  # POST <%= route_url %>
  def create
    run <%= class_name %>::Create do |op|
      return redirect_to op.model
    end

    render action: :new
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    run <%= class_name %>::Update do |op|
      return redirect_to op.model
    end

    render action: :edit
  end

  # DELETE <%= route_url %>/1
  def destroy
    run <%= class_name %>::Delete do |op|
      return redirect_to root_path
    end
  end

end
<% end -%>