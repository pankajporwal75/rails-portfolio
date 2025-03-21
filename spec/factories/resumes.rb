FactoryBot.define do
  factory :resume do
    title {"My Resume"}
    active {true}

    after(:build) do |resume|
      resume.file.attach(
        io: File.open(Rails.root.join("spec/fixtures/files/sample.pdf")),
        filename: "sample.pdf",
        content_type: "application/pdf"
      )
    end
  end
end