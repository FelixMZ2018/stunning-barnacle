# frozen_string_literal: true

module Api
  module V1
    class MessagesController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      def record_not_found
        render json: { status: 404, message: "Message not found" }
      end

      def index
        messages = Message.all
        render json: {status: 200, count: messages.count, messages: messages }
      end

      def create
        message = Message.new(message_params)
        message.content = santize_content(message.content)
        if message.valid?
          message.save
          render json: { status: 200, message: message }
        else
          render json: { status: 400, error: message.errors }
        end
      end

      def show
        message = Message.find(params[:id])
        message.counter = message.counter + 1.to_i
        message.save
        render json: { status: 200, message: message }
      end

      def update
        message = Message.find(params[:id])
        validate = message.update(content: santize_content(params[:content]))
        if validate
          render json: { status: 200, message: message }
        else
          render json: { message: message.errors }
        end
      end

      def destroy
        message = Message.find(params[:id])
        render json: { status: 200, message: "Message with ID:#{message.id} was deleted" }
        message.destroy
      end

      private

      def santize_content(content)
        Rails::Html::SafeListSanitizer.new.sanitize(content, tags: ["a"], attributes: ["href"])
      end

      def message_params
        params.permit(:content)
      end
    end
  end
end
