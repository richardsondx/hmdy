Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, '187370434717652','8726a8623628d9497933189cbba3b577',
  :scope => 'email, user_relationships, user_status, user_about_me, publish_actions', :display => 'popup'
end