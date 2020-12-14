class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @new_badges = 0
  end

  def call
    Badge.select do |badge|
      if badge.honored?(@test_passage)
        @test_passage.user.badges << badge
        @new_badges += 1
      end
    end
    @new_badges
  end
end
