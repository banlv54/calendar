class ToDo < ActiveRecord::Base
  enum status: [:important, :success, :warning, :info, :inverse, :special]
end
