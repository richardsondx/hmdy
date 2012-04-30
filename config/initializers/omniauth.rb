Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, '109989265800865','744992dd6f454af379aec458a0f86e83'
end