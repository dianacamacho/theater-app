class SeatsController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @seats = Seat.where(venue_id: params[:id]).paginate(:page => params[:page], :per_page => 10)
    @venue = Venue.find(params[:id])



    # seating chart gon gem work

    @section_data_for_js = []

    @sections = @venue.sections
    

    gon.venue = @venue
    gon.section_count = @venue.sections.count
    section_data = []





    gon.seats = @seats

  end

  def new
    @seat = Seat.new(venue_id: params[:id])
    @venue = Venue.find(params[:id])
  end

  def create
    @seat = Seat.new(
      seat_section: params[:seat_section],
      seat_row: params[:seat_row],
      seat_number: params[:seat_number],
      venue_id: params[:venue_id],
      row_id: params[:row_id],
      section_id: params[:section_id])

    @venue = Venue.find(params[:id])

    if @seat.save
      flash[:success] = "Seat successfully added."
      redirect_to "/venues/#{@seat.venue_id}/seats/new"
    else 
      render :new
    end
  end

  def edit
    @seat = Seat.find(params[:id])
    @venue = @seat.venue
  end

  def update
    @seat = Seat.find(params[:id])
    @venue = @seat.venue

    if @seat.update(
      seat_section: params[:seat_section],
      seat_row: params[:seat_row],
      seat_number: params[:seat_number],
      venue_id: params[:venue_id],
      row_id: params[:row_id],
      section_id: params[:section_id])

      flash[:success] = "Seat updated."
      redirect_to "/venues/#{@seat.venue_id}/seats"
    else 
      render :edit
    end
  end

  def destroy
    @seat = Seat.find(params[:id])
   
    if @seat.destroy
      flash[:success] = "Seat deleted."
      redirect_to "/venues/#{@seat.venue_id}/seats"
    else
      flash[:warning] = "Unable to delete seat."
      redirect_to "/venues/#{@seat.venue_id}/seats"
    end
  end
  
end
