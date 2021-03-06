class Round < ActiveRecord::Base
  belongs_to :course
  has_many :scorecards, dependent: :destroy

  validates :course, presence: true
  # TODO: validate that the round has at least one scorecard

  scope :by_date, -> { order('created_at DESC') }

  delegate :holes, to: :course

  def completed?
    marked_complete? || scorecards.all?(&:completed?)
  end

  def complete
    update(marked_complete: true)
  end

  def turns_for_hole(hole)
    Turn.where(scorecard: scorecards, hole: hole)
  end
end
