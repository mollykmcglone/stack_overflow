describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }

  it { should have_many :questions }
end
