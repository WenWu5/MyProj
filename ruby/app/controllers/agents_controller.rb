class AgentsController < ApplicationController
  def show
    @agent = Agent.find(params[:id])
    
    #append land and mobile home type only after no land + mobile home transactions
    #to show at bottom of list.
    @uploaded_transactions = @agent.noland_nomobile_transactions + @agent.land_mobile_transactions
  end

  def random_agent
    redirect_to agent_path(Agent.all.sample)
  end
end
