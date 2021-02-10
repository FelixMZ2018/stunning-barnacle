# frozen_string_literal: true

module Api
  module V1
    class MessagesController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      def record_not_found
        render json: { status: 404, message: "Message not found" }
      end

      def index
        render json: { Error: "Messages can only be accessed via their UUID" }, status: 403
      end

      def create
        message = Message.new(message_params)
        if message.valid?
          message.save
          render json: { status: 200, message: message }
        else
          render json: { status: 400, error: message.errors }
        end
      end

      def show
        message = Message.find(params[:id])
        render json: { status: 200, message: message }
      end

      def destroy
        message = Message.find(params[:id])
        render json: { status: 200, message: "Message with ID:#{message.id} was deleted"}
        message.destroy
      end

      private

      def message_params
        params.permit(:content)
      end
    end
  end
end
