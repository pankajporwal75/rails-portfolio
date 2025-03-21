FactoryBot.define do
  factory :project do
    name { "Pankaj Portfolio" }
    description { "This is my portfolio" }
    active { true }

    after(:build) do |project|
      project.image.attach(
        io: File.open(Rails.root.join("spec/fixtures/files/sample.png")),
        filename: "sample.png",
        content_type: "image/png"
      )
    end
  end
end
