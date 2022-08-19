module Authorization
  extend ActiveSupport::Concern

  included do
    class NotAuthorizedError < StandardError; end

    rescue_from NotAuthorizedError do
      redirect_to products_path, alert: t('commond.not_authorized')
    end

    private

    def authorized?(record = nil)
      is_allowed = "#{controller_name.singularize}Policy".classify.constantize.new(record).send(action_name)

      raise NotAuthorizedError unless is_allowed
    end
  end
end