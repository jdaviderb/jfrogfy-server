# frozen_string_literal:true

class CacheMiddleware
  CACHE_KEY = "JFROGFY_CACHE"
  CACHE_EXPIRE = 15.minutes

  def initialize(app)
    @app = app
    @caches = {}
    @caches_expires = {}
  end

  def call(env)
    response = cache(env)
    if response.blank?
      update_cache(env)
      cache(env)
    else
      response
    end
  end

  def update_cache(env)
    cache_key = CACHE_KEY + env["REQUEST_URI"]
    @status, @headers, @response = @app.call(env)
    @caches[cache_key] = [@status, @headers, @response]
    @caches_expires[cache_key] = Time.current + CACHE_EXPIRE
  end

  def cache(env)
    cache_key = CACHE_KEY + env["REQUEST_URI"]
    cache_expire_date = @caches_expires[cache_key]

    if cache_expire_date.present? && cache_expire_date <= Time.current
      @caches[cache_key] = nil
    end

    @caches[cache_key]
  end
end
