module FormVerification
  module FormBuilder
    def verification_token_field
      template.hidden_field_tag(
        :"_verification_token",
        nil,
        data: { value: object_name }
      )
    end
  end
end
