class Message < ApplicationRecord
  after_create_commit lambda {
    broadcast_append_to 'stream_messages',
                        target: 'messages',
                        partial: 'messages/message', locals: { message: self, loading: true }
  }
end
