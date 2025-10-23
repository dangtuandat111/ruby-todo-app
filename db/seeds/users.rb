require 'factory_bot_rails'
include FactoryBot::Syntax::Methods

10.times { create(:user) }