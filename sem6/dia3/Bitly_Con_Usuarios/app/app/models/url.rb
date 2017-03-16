class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :long_url, presence: true
  validate :domain_validator

  def hit
    self.hits += 1
  end

  before_create :short
  def short
    self.short_url = get_shorten
  end

  private
  def domain_validator
    return if self.long_url.nil?
    uri = URI(self.long_url)

    if uri.scheme.nil?
      self.errors[:long_url] << "falta http"
    else
      self.errors[:long_url] << "solo se permite http, https" unless uri.scheme == "http" || uri.scheme == "https"
    end

    if uri.host.nil?
      self.errors[:long_url] << "falta dominio"
    else
      self.errors[:long_url] << "dominio invalido" unless valid_domain?(uri.host)
    end
  end

  def valid_domain?(domain)
    result = domain =~ /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/
    result.nil? ? false : true
  end
  def get_shorten
    samples = ("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a.collect(&:to_s)
    exist = ""
    url = ""
    begin
      url = ""
      5.times {url += samples.sample}
      exist = Url.where("short_url = ?", url).first
    end until exist.nil?
    url
  end
end
