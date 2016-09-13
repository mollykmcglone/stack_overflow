FactoryGirl.define do
  factory(:question) do
    title("How are you?")
    content("Fine, thanks. And you?")
    user
    votes(0)
  end
end
