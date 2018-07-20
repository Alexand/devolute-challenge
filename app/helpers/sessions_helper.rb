# Helper methods defined here can be accessed in any controller or view in the application

module Devolute
  class App
    module SessionsHelper
      def current_account=(account)
        @current_account = account
      end

      def current_account
        @current_account ||= Account.find_by_id(session[:current_account])
      end

      def current_account?(account)
        account == current_account
      end

      def sign_in(account)
        session[:current_account] = account.id
        self.current_account = account
      end

      def sign_out
        session.delete(:current_account)
      end

      def signed_in?
        !current_account.nil?
      end
    end

    helpers SessionsHelper
  end
end
