# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_timekeeper-webapp_session',
  :secret      => 'a931a35920a8e475379d64daa0d5e615715c8feb412f4f62fddd9102ca224453c101ace88f2d3f7d8089bd3dea612193dc340770aab2b4adfca75a9930f08a6d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
