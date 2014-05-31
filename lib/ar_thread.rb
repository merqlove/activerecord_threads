class ARThread
  def self.start(&block)
    Thread.new do
      ActiveRecord::Base.connection_pool.with_connection &block
    end
  end
end