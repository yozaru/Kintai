class KintaisController < ApplicationController
  before_action :set_kintai, only: [:show, :edit, :update, :destroy]
  # GET /kintais
  # GET /kintais.json
  def index
#    @kintais = Kintai.all
    @kintais = Kintai.order(params[:sort])
#    @users = User.order(params[:sort]).order(params[:sort])
    Timestore.import
    @zero_time = 0
    @late_time = 10
    @hiru_time = 13
    @night_time = 23
    @asa = 0
    @hiru = 0
    @zangyo = 0
    # 設定
    @sort = params[:sort].nil? ? 'employee_id' : params[:sort]
    if @sort  == session[:sort]
      @direction = session[:direction] == 'asc' ? 'desc' : 'asc'
    else
      @direction = 'asc'
    end
    # データ呼び出し
    @kintais = Kintai.order(@sort + ' ' + @direction)
    # セッション保存
    session[:sort] = @sort
    session[:direction] = @direction
    
  respond_to do |format|
      format.html
      format.csv { send_data @kintais.to_csv, type: 'text/csv; charset=shift_jis', filename: "kintais.csv" } 
  end
 end 

  def mb_ljust(width, padding=' ')
    output_width = each_char.map{|c| c.bytesize == 1 ? 1 : 2}.reduce(0, &:+)
    padding_size = [0, width - output_width].max
    self + padding * padding_size
  end

  def kako
 #   @archives = Archive.order(params[:sort])
    Timestore.import
    # 設定
    @sort = params[:sort].nil? ? 'employee_id' : params[:sort]
    if @sort  == session[:sort]
      @direction = session[:direction] == 'asc' ? 'desc' : 'asc'
    else
      @direction = 'asc'
    end
    # データ呼び出し
    #月の判定
    @archives = Archive.where("month = ?", params[:month]).order(@sort + ' ' + @direction)
    
    # セッション保存
    session[:sort] = @sort
    session[:direction] = @direction

  respond_to do |format|
      format.html
      format.csv { send_data @archives.to_csv, type: 'text/csv; charset=shift_jis', filename: "kintais.csv" }
  end
 end


  def kanri
    @kintais = Kintai.order(params[:sort]).order(params[:sort])
    @zero_time = 0
    @late_time = 10
    @hiru_time = 13
    @night_time = 23
    @asa = 0
    @hiru = 0
    @zangyo = 0
        @sort = params[:sort].nil? ? 'employee_id' : params[:sort]
    if @sort  == session[:sort]
      @direction = session[:direction] == 'asc' ? 'desc' : 'asc'
    else
      @direction = 'asc'
    end
         @kintais = Kintai.order(@sort + ' ' + @direction)
                 session[:sort] = @sort
                     session[:direction] = @direction
    
                         respond_to do |format|
                               format.html # index.html.erb
                         format.json { render json: @kintais }
     end  
  end
  
  # GET /kintais/1
  # GET /kintais/1.json
  def show
  end

  # GET /kintais/new
  def new
    @kintai = Kintai.new
  end

  # GET /kintais/1/edit
  def edit
  end
  
  def chatwork
	test_t = Array.new
	ChatWork.api_key = "66496d47070398f1824d380bbebbcdfe"
        ChatWork::Message.create(room_id: 34476675, body: "[info][title](F)改行のテスト[/title]昨日の深夜残業の報告させて頂きます[/info]")
        ChatWork::Message.create(room_id: 34476675, body: "報告させて頂きます\ntest\ntest")
	p chatwork
  end

  def shinya
        legend = 0
        chaos = 0
        grimoire = 0
        gang = 0
        eagle = 0
        chronos = 0
        nine = 0
        sugomon = 0
        legend_c = Array.new
        legend_s = Array.new
        legend_a = Array.new
        chaos_s = Array.new
        chaos_a = Array.new
        grimoire_s = Array.new
        grimoire_a = Array.new
        gang_s = Array.new
        gang_a = Array.new
        eagle_s = Array.new
        eagle_a = Array.new
        chronos_s = Array.new
        chronos_a = Array.new
        sugomon_s = Array.new
        sugomon_a = Array.new
        nine_s = Array.new
        nine_a = Array.new
        chaos_c = Array.new
        grimoire_c = Array.new
        gang_c = Array.new
        eagle_c = Array.new
        chronos_c = Array.new
        sugomon_c = Array.new
        nine_c = Array.new
        kintais = Kintai.all
        kintais.each do |kintai|
	if kintai.ytaisha.hour >= 23 or kintai.ytaisha.hour.between?(1, 5) then
                if kintai.project == "レジェンド"
                        legend_c[legend] = kintai.name
                        legend_s[legend] = kintai.ytaisha
                        legend_a[legend] = kintai.shusha
                        legend = legend + 1
                elsif kintai.project == "ケイオス"
                        chaos_c[chaos] = kintai.name
                        chaos_s[chaos] = kintai.ytaisha
                        chaos_a[chaos] = kintai.shusha
                        chaos = chaos + 1
                elsif kintai.project == "グリモア"
                        grimoire_c[grimoire] = kintai.name
			grimoire_s[grimoire] = kintai.ytaisha
			grimoire_a[grimoire] = kintai.shusha
                        grimoire = grimoire + 1
                elsif kintai.project == "ジョーカー"
                        gang_c[gang] = kintai.name
                        gang_s[gang] = kintai.ytaisha
                        gang_a[gang] = kintai.shusha
                        gang = gang + 1
                elsif kintai.project == "イーグル"
                        eagle_c[eagle] = kintai.name
                        eagle_s[eagle] = kintai.ytaisha
                        eagle_a[eagle] = kintai.shusha
                        eagle = eagle + 1
                elsif kintai.project == "ナイン"
                        nine_c[nine] = kintai.name
                        nine_s[nine] = kintai.ytaisha
                        nine_a[nine] = kintai.shusha
                        nine = nine + 1
                elsif kintai.project == "スゴモン"
                        sugomon_c[sugomon] = kintai.name
                        sugomon_s[sugomon] = kintai.ytaisha
                        sugomon_a[sugomon] = kintai.shusha
                        sugomon = sugomon + 1
                elsif kintai.project == "クロノス"
                        chronos_c[chronos] = kintai.name
                        chronos_s[chronos] = kintai.ytaisha
                        chronos_a[chronos] = kintai.shusha
                        chronos = chronos + 1
                end
		end
        end
 
	ChatWork.api_key = "66496d47070398f1824d380bbebbcdfe"
	ChatWork::Message.create(room_id: 34476675, body: "[info][title](F)深夜残業のご報告[/title]昨日の深夜残業の報告させて頂きます[/info]")
	if legend > 0
                ChatWork::Message.create(room_id: 34476675, body: "[info]レジェンドは23時以降帰宅が#{legend}人います(devil)[To:580445][/info]")
        end
        legend = legend -1
        while legend >= 0 do
#                ChatWork::Message.create(room_id: 34476675, body: "#{legend_c[legend].gsub("　","").ljust(6,"　")}#{legend_s[legend].strftime("%H時%M分")}帰宅   #{legend_a[legend].strftime("%H時%M分")}時出社")
                ChatWork::Message.create(room_id: 34476675, body: "#{legend_c[legend].gsub("　","").ljust(6,"　")}#{legend_s[legend].strftime("%H時%M分")}帰宅   #{legend_a[legend].strftime("%H時%M分")}出社")
                legend = legend -1
        end

	if chaos > 0
                ChatWork::Message.create(room_id: 34476675, body: "[info]ケイオスは23時以降帰宅が#{chaos}人います(devil)[To:580445][/info]")
        end
        chaos = chaos -1
        while chaos >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{chaos_c[chaos].gsub("　","").ljust(6,"　")}#{chaos_s[chaos].strftime("%H時%M分")}帰宅   #{chaos_a[chaos].strftime("%H時%M分")}出社")
                chaos = chaos -1
        end

	if grimoire > 0
                ChatWork::Message.create(room_id: 34476675, body: "[info]グリモアは23時以降帰宅が#{grimoire}人います(devil)[To:580445][/info]")
        end
        grimoire = grimoire -1
        while grimoire >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{grimoire_c[grimoire].gsub("　","").ljust(6,"　")}#{grimoire_s[grimoire].strftime("%H時%M分")}帰宅   #{grimoire_a[grimoire].strftime("%H時%M分")}出社")
                grimoire = grimoire -1
        end

	if gang > 0
                ChatWork::Message.create(room_id: 34476675, body: "[info]ジョーカーは23時以降帰宅が#{gang}人います(devil)[To:580445][/info]")
        end
        gang = gang -1
        while gang >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{gang_c[gang].gsub("　","").ljust(6,"　")}#{gang_s[gang].strftime("%H時%M分")}帰宅   #{gang_a[gang].strftime("%H時%M分")}出社")
                gang = gang -1
        end

	 if eagle > 0
                ChatWork::Message.create(room_id: 34476675, body: "[info]イーグルは23時以降帰宅が#{eagle}人います(devil)[To:580445][/info]")
        end
        eagle = eagle -1
        while eagle >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{eagle_c[eagle].gsub("　","").ljust(6,"　")}#{eagle_s[eagle].strftime("%H時%M分")}帰宅   #{eagle_a[eagle].strftime("%H時%M分")}出社")
                eagle = eagle -1
        end

	 if sugomon > 0
                ChatWork::Message.create(room_id: 34476675, body: "[info]スゴモンは23時以降帰宅が#{sugomon}人います(devil)[To:580445][/info]")
        end
        sugomon = sugomon -1
        while sugomon >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{sugomon_c[sugomon].gsub("　","").ljust(6,"　")}#{sugomon_s[sugomon].strftime("%H時%M分")}帰宅   #{sugomon_a[sugomon].strftime("%H時%M分")}出社")
                sugomon = sugomon -1
        end

	 if nine > 0
                ChatWork::Message.create(room_id: 34476675, body: "[info]ナインは23時以降帰宅が#{nine}人います(devil)[To:580445][/info]")
        end
        nine = nine -1
        while nine >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{nine_c[nine].gsub("　","").ljust(6,"　")}#{nine_s[nine].strftime("%H時%M分")}帰宅   #{nine_a[nine].strftime("%H時%M分")}出社")
                nine = nine -1
        end
       
	if chronos > 0
                ChatWork::Message.create(room_id: 34476675, body: "[info]クロノスは23時以降帰宅が#{chronos}人います(devil)[To:580445][/info]")
        end
        chronos = chronos -1
        while chronos >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{chronos_c[chronos].gsub("　","").ljust(6,"　")}#{chronos_s[chronos].strftime("%H時%M分")}帰宅   #{chronos_a[chronos].strftime("%H時%M分")}出社")
                chronos = chronos -1
        end
 
  end


  def chikoku
	i = 0
	legend = 0
	chaos = 0
	grimoire = 0
	gang = 0
	eagle = 0
	chronos = 0
	nine = 0
	sugomon = 0
	back = 0
		
	array = Array.new
	legend_c = Array.new
	chaos_c = Array.new
	grimoire_c = Array.new
	gang_c = Array.new
	eagle_c = Array.new
	chronos_c = Array.new
	sugomon_c = Array.new
	nine_c = Array.new
	kintai = Kintai.all
	kintai.each do |kintai|
	if kintai.shusha.hour == 0 then
		ChatWork.api_key = "66496d47070398f1824d380bbebbcdfe"
		array[i] = kintai.name 
		i = i + 1
        	if kintai.project == "レジェンド"
			legend_c[legend] = kintai.name
			legend = legend + 1
		elsif kintai.project == "ケイオス"
			chaos_c[chaos] = kintai.name
			chaos = chaos + 1
		elsif kintai.project == "グリモア"
			grimoire_c[grimoire] = kintai.name
			grimoire = grimoire + 1
		elsif kintai.project == "ジョーカー"
			gang_c[gang] = kintai.name
			gang = gang + 1
		elsif kintai.project == "イーグル"
			eagle_c[eagle] = kintai.name
			eagle = eagle + 1
		elsif kintai.project == "ナイン"
			nine_c[nine] = kintai.name
			nine = nine + 1
		elsif kintai.project == "スゴモン"
			sugomon_c[sugomon] = kintai.name
			sugomon = sugomon + 1
		elsif kintai.project == "クロノス"
			chronos_c[chronos] = kintai.name
			chronos = chronos + 1
		end
	end
	end
#	legend_c.map! {|item| item.to_s }
#	ChatWork::Message.create(room_id: 34476675, body: "#{array}は欠勤です")
	ChatWork::Message.create(room_id: 34476675, body: "[info][title](F)欠勤のご報告[/title]本日の欠勤の報告をさせて頂きます[/info]")
	if legend > 0
		ChatWork::Message.create(room_id: 34476675, body: "[info]レジェンドはCAPIデータなしが#{legend}人います(F)[To:580445][/info]")
	end
	legend = legend -1
	while legend >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{legend_c[legend]}")
                legend = legend -1
	end

	if chaos > 0
		ChatWork::Message.create(room_id: 34476675, body: "[info]ケイオスはCAPIデータなしが#{chaos}人います(F)[To:580445][/info]")
	end
	chaos = chaos -1
	while chaos >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{chaos_c[chaos]}")
		chaos = chaos -1
	end
	
	if grimoire > 0
		ChatWork::Message.create(room_id: 34476675, body: "[info]グリモアは#{grimoire}人CAPIのデータなしです(F)[To:580445][/info]")
	end
	grimoire = grimoire -1
	while grimoire >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{grimoire_c[grimoire]}")
		grimoire = grimoire -1
	end
	
	if gang > 0
		ChatWork::Message.create(room_id: 34476675, body: "[info]ジョーカーは#{gang}人CAPIのデータなしです(F)[To:580445][/info]")
	end
	gang = gang -1
	while gang >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{gang_c[gang]}")
		gang = gang -1
	end

	if eagle > 0
		ChatWork::Message.create(room_id: 34476675, body: "[info]イーグルは#{eagle}人CAPIのデータなしです(F)[To:580445][/info]")
	end
	eagle = eagle -1
	while eagle >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{eagle_c[eagle]}")
		eagle = eagle -1
	end
	
	if nine > 0
		ChatWork::Message.create(room_id: 34476675, body: "[info]ナインは#{nine}人CAPIのデータなしです(F)[To:580445][/info]")
	end
	nine = nine -1
	while nine >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{nine_c[nine]}")
		nine = nine -1
	end
	
	if sugomon > 0
	ChatWork::Message.create(room_id: 34476675, body: "[info]スゴモンは#{sugomon}人欠勤です(F)[To:580445][/info]")
	end
	sugomon = sugomon -1
	while sugomon >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{sugomon_c[sugomon]}")
		sugomon = sugomon -1
	end
	
	if chronos > 0
		ChatWork::Message.create(room_id: 34476675, body: "[info]クロノスは#{chronos}人CAPIのデータなしです(F)[To:580445][/info]")
	end
	chronos = chronos -1
	while chronos >= 0 do
                ChatWork::Message.create(room_id: 34476675, body: "#{chronos_c[chronos]}")
		chronos = chronos -1
  	end
  end

  def zangyo
  end

  # POST /kintais
  # POST /kintais.json
  def create
    @kintai = Kintai.new(kintai_params)
    respond_to do |format|
      if @kintai.save
        format.html { redirect_to @kintai, notice: 'Kintai was successfully created.' }
        format.json { render :show, status: :created, location: @kintai }
        ChatWork.api_key = "66496d47070398f1824d380bbebbcdfe"
        ChatWork::Message.create(room_id: 34476675, body: "新しい従業員#{@kintai.name}が追加されました") 
      else
        format.html { render :new }
        format.json { render json: @kintai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kintais/1
  # PATCH/PUT /kintais/1.json
  def update
    respond_to do |format|
      if @kintai.update(kintai_params)
        format.html { redirect_to @kintai, notice: 'Kintai was successfully updated.' }
        format.json { render :show, status: :ok, location: @kintai }
      else
        format.html { render :edit }
        format.json { render json: @kintai.errors, status: :unprocessable_entity }
      end
    end
  end

    def search
      @kintais = Kintai.search_names_or(params[:stxt])
      @zero_time = 0
      @late_time = 10
      @hiru_time = 13
      @night_time = 23
      @asa = 0
      @hiru = 0
      @zangyo = 0
      render :index
   end

  def import_csv_new  
  end
  
  def import_csv
  respond_to do |format|
    if Kintai.import_csv(params[:csv_file])
      format.html { redirect_to kintais_path }
      format.json { head :no_content }
    else
      format.html { redirect_to kintais_path, :notice => "CSVファイルの読み込みに失敗しました。" }
      format.json { head :no_content }
    end
  end
  end 




  # DELETE /kintais/1
  # DELETE /kintais/1.json
  def destroy
    @kintai.destroy
    respond_to do |format|
      format.html { redirect_to kintais_url, notice: 'Kintai was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kintai
      @kintai = Kintai.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kintai_params
      params.require(:kintai).permit(:employee_id , :name, :shusha, :taisha, :project, :job, :sex, :idm, :ytaisha, :sum )
    end

end
