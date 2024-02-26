class Api::V1::DownloadsController < ApplicationController
  before_action :set_download, only: %i[ show update destroy ]

  # GET /downloads
  def index
    @downloads = Download.all

    render json: @downloads
  end

  # GET /downloads/1
  def show
    render json: @download
  end

  # POST /downloads
  def create
    @download = Download.new(download_params)

    if @download.save
      render json: @download, status: :created, location: @download
    else
      render json: @download.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /downloads/1
  def update
    if @download.update(download_params)
      render json: @download
    else
      render json: @download.errors, status: :unprocessable_entity
    end
  end

  # DELETE /downloads/1
  def destroy
    @download.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_download
      @download = Download.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def download_params
      params.require(:download).permit(:song, :time)
    end
end
