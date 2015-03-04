require 'rails/generators'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Rails
  module Generators
    class TrailblazerControllerGenerator < ScaffoldControllerGenerator
      source_root File.expand_path("../templates", __FILE__)

      def create_controller_files
        template "controller.rb", File.join('app/controllers', controller_class_path, "#{controller_file_name}_controller.rb")
      end

      def create_concept_files
        empty_directory File.join('app/concepts', singular_table_name)
        template "crud.rb", File.join('app/concepts', singular_table_name, "crud.rb")
      end

      def add_crud_dependency_to_model
        if File.exists? File.join('app/models', "#{singular_table_name}.rb")
          append_to_file File.join('app/models', "#{singular_table_name}.rb") do
            "\nrequire_dependency \"#{singular_table_name}/crud\""
          end
        end
      end
    
    end
  end
end