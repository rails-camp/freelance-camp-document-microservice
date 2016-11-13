class FreelanceDocumentsController < ApplicationController
  before_action :set_freelance_document, only: [:show, :update, :destroy]

  # GET /freelance_documents
  def index
    @freelance_documents = FreelanceDocument.all

    render json: @freelance_documents
  end

  # GET /freelance_documents/1
  def show
    render json: @freelance_document
  end

  # POST /freelance_documents
  def create
    @freelance_document = FreelanceDocument.new(freelance_document_params)

    if @freelance_document.save
      render json: @freelance_document, status: :created, location: @freelance_document
    else
      render json: @freelance_document.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /freelance_documents/1
  def update
    if @freelance_document.update(freelance_document_params)
      render json: @freelance_document
    else
      render json: @freelance_document.errors, status: :unprocessable_entity
    end
  end

  # DELETE /freelance_documents/1
  def destroy
    @freelance_document.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freelance_document
      @freelance_document = FreelanceDocument.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def freelance_document_params
      params.require(:freelance_document).permit(:title, :description, :file_url, :image_url)
    end
end
