class InvoicesController < ApplicationController



  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = current_user.invoices.order("updated_at DESC").page params[:page]
    @unpaid = @invoices.where("paid = ?", false)
    @paid = @invoices.where("paid = ?", true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find_by_rand(params[:id])
    @client = Client.find(@invoice.client_id)
    @user = User.find(@invoice.user_id)
    @total = 0
    @invoice.items.each do |i|
      @total += (i.rate * i.count).round(2)
    end
    @total += @invoice.materials if @invoice.materials.present?
    @total += @invoice.travel if @invoice.travel.present?
    @total += @invoice.other if @invoice.other.present?
    @total += @invoice.previous_paid if @invoice.previous_paid.present?
    if @invoice.taxed? && @user.tax.present?
      @tax = @total * @user.tax
      @total += @tax
    end

    respond_to do |format|
      format.html {render :layout => false}
      format.json { render json: @invoice }
      format.pdf  { render  :pdf => "invoice",
                :template => '/invoices/pdf.html.erb',
                :layout => false,
                :handlers => [:erb]}
    end
  end

  # MAIL the invoice
  def mail
    @invoice = Invoice.find_by_rand(params[:id])
    @client = Client.find(@invoice.client_id)
    @total = 0
    @invoice.items.each do |i|
      @total += (i.rate * i.count).round(2)
    end
    @total += @invoice.materials if @invoice.materials.present?
    @total += @invoice.travel if @invoice.travel.present?
    @total += @invoice.other if @invoice.other.present?
    @total += @invoice.previous_paid if @invoice.previous_paid.present?
    if @invoice.taxed? && @user.tax_rate.present?
      @tax = @total * @user.tax_rate
      @total += @tax
    end
    InvoiceMailer.mail_invoice(@client, @invoice, @total).deliver
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully sent. Rake in that money.' }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new
    clients = current_user.clients.order("name ASC")
    @client_names = []
    clients.each do |c|
      @client_names << c.name
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find_by_rand(params[:id])
    clients = current_user.clients.order("name ASC")
    @client_names = []
    clients.each do |c|
      @client_names << c.name
    end
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.user_id = current_user.id
    @invoice.client_id = Client.find_by_name(params[:invoice][:client_name]).id
    @invoice.number = Client.find(@invoice.client_id).invoices.count + 1
    @invoice.rand = current_user.name.downcase.gsub(/\s+/, '-').gsub(/[^a-z0-9_-]/, '').squeeze('-')+'-'+SecureRandom.hex(16)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created. Rake in that money.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find_by_rand(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated. Whew.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find_by_rand(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private

  def check_user
    if @user != current_user
      redirect_to root_path, :notice => "Sorry, you can't access that information. Life is full of disappointment."
    end
  end
end
