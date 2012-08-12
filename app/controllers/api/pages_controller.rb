class Api::PagesController < ApplicationController  
  # GET /api/pages
  # GET /api/pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
      format.xml { render xml: @pages }
    end
  end

  # GET /api/pages/1
  # GET /api/pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
      format.xml { render xml: @page }
    end
  end

  # GET /api/pages/new
  # GET /api/pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
      format.xml { render xml: @page }
    end
  end

  # GET /api/pages/1/edit
  def edit
    @page = Page.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
      format.xml { render xml: @page }
    end
  end

  # POST /api/pages
  # POST /api/pages.json
  # POST /api/pages.xml
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to api_page_path(@page), notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: api_page_path(@page) }
        format.xml { render xml: @page, status: :created, location: api_page_path(@page) }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
        format.xml { render xml: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/pages/1
  # PUT /api/pages/1.json
  def update
    @page = Page.find(params[:id])
    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to api_page_path(@page), notice: 'Page was successfully updated.' }
        format.json { head :no_content }
        format.xml { head :no_content  }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
        format.xml { render xml: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/pages/1
  # DELETE /api/pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to api_pages_url }
      format.json { head :no_content }
      format.xml { head :no_content  }
    end
  end
  
  def published
    @pages = Page.published
    respond_to do |format|
      format.html # published.html.erb
      format.json { render json: @pages }
      format.xml { render xml: @pages }
    end
  end
  
  def unpublished
    @pages = Page.unpublished
    respond_to do |format|
      format.html # unpublished.html.erb
      format.json { render json: @pages }
      format.xml { render xml: @pages }
    end
  end

  def publish
    @page = Page.find(params[:id])
    respond_to do |format|
      if @page.publish
        format.html { redirect_to api_page_path(@page), notice: 'Page was successfully published.' }
        format.json { head :no_content }
        format.xml { head :no_content  }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
        format.xml { render xml: @page.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def total_words
    @page = Page.find(params[:id])
    respond_to do |format|
      format.html { render text: @page.total_word_count }
      format.json { render text: @page.total_word_count }
      format.xml { render text: @page.total_word_count }
    end
  end
end
