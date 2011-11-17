class TalksController < ApplicationController
  def index
    @talks = Talk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @talks }
    end
  end

  def new
    @talk = Talk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @talk }
    end
  end

  def create
    @talk = Talk.new(params[:talk])

    respond_to do |format|
      if @talk.save
        format.html { redirect_to Talk, notice: 'Talk was successfully created.' }
        format.json { render json: @talk, status: :created, location: @talk }
      else
        format.html { render action: "new" }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end
end
