class Checklist < ApplicationRecord
  has_rich_text :content

  belongs_to :subject
  after_create :prefill_with_suggestions

  def prefill_with_suggestions
    items = subject.checklist_items([])
      .map { |text| "<li>#{text}</li>" }
      .join("\n")

    update! content: <<~HTML
      <div class="trix-content">
        <strong>Your #{subject.term} is currently in a draft.</strong> Before you publish it, here's a list of things you might want to check off.<br>
        <ul>
          #{items}
        </ul>
      </div>
    HTML
  end
end