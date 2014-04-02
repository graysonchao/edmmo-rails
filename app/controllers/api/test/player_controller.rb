class Api::Test::PlayerController < ApplicationController

  def move
    dir = request[:direction]
    if dir == 'north' or dir == 'east'
      render :json => {:err => 0}
    elsif dir == 'south'
      render :json => {:err => 2}
    else
      render :json => {:err => 1}
    end
  end

  def pickup
    x = request[:x]
    y = request[:y]
    id = params[:itemID]

    if x > 0
      render :json => {:err => 2} #can't access 
    elsif y > 0
      render :json => {:err => 3} #hands are full
    elsif id == "cake"
      render :json => {:err =>1} #doesn't exist
    else
      render :json => {:err => 0} #success
    end
  end

  def drop
    id = request[:itemID]
    if id == 'nothing'
      render :json => {:err => 1}
    elsif id == 'occupied'
      render :json => {:err => 2}
    else
      render :json => {:err => 0}
    end
  end

  def dig
    render :json => {:err => 0}
  end

  def use
    id = request[:itemID]
    args = request[:args]
    if id == 'cake'
      render :json => {:err => 1}
    elsif args == 'bad'
      render :json => {:err => 2}
    else
      render :json => {:err => 0}
    end
  end

  def status
    render :json => {:hp => 100, :battery => 100}
  end

  def inspect
    id = params[:itemID]
    if id == 'cake'
      render :json => {:err => 1}
    else
      render :json => {:err => 0}
    end 
  end

  def characters
    render :json => {:err => 0}
  end

end
