module ErrorsToFlash
  module ActionController
    module Filters
      extend ActiveSupport::Concern

      class_methods do
        def errors_to_flash(args)
          raise ArgumentError.new "Fields not defined" unless args[:fields]
          raise ArgumentError.new "Fields are empty" if args[:fields].length == 0

          after_action args do
            flash[:error] = "" if flash[:error].nil?

            flash[:error] = args[:fields].inject(flash[:error]) do |sum, field|
              model = instance_variable_get(("@" + field.to_s).intern)

              if model
                sum + model.errors.full_messages.join(". ")
              else
                sum
              end
            end
          end
        end
      end

    end
  end
end