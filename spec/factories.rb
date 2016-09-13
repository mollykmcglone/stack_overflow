FactoryGirl.define do
  factory(:user) do
    email("Person@gmail.com")
    password("password")
    password_confirmation("password")
  end

  factory(:question) do
    title("How are you?")
    content("Fine, thanks. And you?")
    user
    votes(0)
  end
end
