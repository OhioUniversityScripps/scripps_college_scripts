class User
  DEFAULT_QUOTA = (2).to_bytes_from_gb.to_i
  @data = {}

  def uid
    if @data[:uid].nil?
      @data[:uid] = pid
      @data[:uid][0] = '1' unless @data[:uid].nil?
    end
    @data[:uid]
  end

  def uid=(given_uid)
    @data[:uid] = given_uid
  end

  def full_name
    if @data[:full_name].nil?
      @data[:full_name] = [first_name, last_name].join(' ')
    end

    @data[:full_name]
  end

  def full_name=(name)
    @data[:full_name] = name
  end

  def privilege
    if @data[:privilege].nil?
      #If TCOM or MDIA major, parse out their major and put them in that group
      if @data[:major].nil? #This is to stay compatible with old versions of the registrar format
        @data[:major] = @data[:major_program]
      end

      unless @data[:major].nil?
        @data[:privilege] ||= (major.include?("tcom") || major.include?("mdia")) ? major[2..5].to_i : 1099 #Non-major
      end
    end
    @data[:privilege]
  end

  def privilege=(given_privlege)
    if given_privilege.integer?
      @data[:privilege] = given_privilege
    else
      raise "Expected integer"
    end
  end

  def user_id
    if @data[:user_id].nil?
      if email.nil?
        @data[:user_id] = nil
      else
        @data[:user_id] = @data[:email].split('@').first
        @data[:user_id].downcase!
      end
    end

    @data[:user_id]
  end

  def user_id=(given_user_id)
    @data[:user_id] = given_user_id
  end

  def pid
    @data[:pid] = @data[:pid].downcase if @data[:pid]
    @data[:pid]
  end

  def pid=(given_pid)
    @data[:pid] = given_pid
  end

  def quota()
    @data[:quota] ||= DEFAULT_QUOTA
  end

  def quota=(given_quota)
    if given_quota.integer?
      @data[:quota] = given_quota
    else
      raise "Expected integer"
    end
  end

  def first_name
    @data[:first_name].capitalize
  end

  def last_name
    @data[:last_name].capitalize
  end

  def method_missing(method_name, *args)
    #Return the information contained in the @data hash.
    #If nothing exists, it will raise
    if output = @data[method_name.to_sym]
      output.downcase
    else
      nil
    end
  end

  #Make sure this user object contains all REQUIRED attributes
  def valid?
    user_id && pid && full_name
  end

  def initialize(data)
    @data = data
  end
end