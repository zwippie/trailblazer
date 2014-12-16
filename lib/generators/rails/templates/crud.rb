<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= class_name %> < ActiveRecord::Base
  class Create < Trailblazer::Operation
    include CRUD
    model <%= class_name %>, :create

    contract do
      # property :name, validates: { presence: true }
    end

    def process(params)
      validate(params[:<%= singular_table_name %>]) do |f|
        f.save!
        # Do something important here
      end
    end
  end

  class Update < Create
    action :update
  end

  class Delete < Create
    action :find
    
    def process(params)
      model.destroy
      self
    end
  end

end
<% end -%>