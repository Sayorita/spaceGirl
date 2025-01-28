class ExampleController < ApplicationController
  def test
    @current_time = Time.zone.now
  end
end
