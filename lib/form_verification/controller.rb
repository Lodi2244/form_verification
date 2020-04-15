module FormVerification
  class VerificationTokenNotFound < StandardError; end

  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      def verify_form_token(object_name, options = {})
        before_action(options) do
          unless params[:_verification_token] == object_name.to_s
            raise FormVerification::VerificationTokenNotFound.new(
              'The verification token could not be found for the form. ' \
              "Expected it to match an object named #{ object_name }"
            )
          end
        end
      end
    end
  end
end
