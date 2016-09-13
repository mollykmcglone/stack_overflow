describe Question do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :votes }
  it { should belong_to :user }
end
