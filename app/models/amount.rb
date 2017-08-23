class Amount < ActiveRecord::Base
  def default
    self.value = 1000
  end
end
