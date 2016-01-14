# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_little-shop-private-stache_session'

Rails.application.config.middleware.insert_before(Rails.application.config.session_store, FlashSessionCookieMiddleware, Rails.application.config.session_options[:key])