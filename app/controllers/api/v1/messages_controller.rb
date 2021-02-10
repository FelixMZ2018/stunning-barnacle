# frozen_string_literal: true

module Api
  module V1
    class MessageController < ApplicationController
      def index; end

      def create; end

      def show; end

      def destroy; end

      private

      def message_params
        params.permit(:content)
      end
    end
  end
end
