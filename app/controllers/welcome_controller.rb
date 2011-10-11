class WelcomeController < ApplicationController
  def index
    @team = Team.new
    @team.members.build
  end

end
