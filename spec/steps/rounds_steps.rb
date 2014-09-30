step 'I scored 12 points in that round' do
  expect(@round).to be_present
  scorecard = @round.scorecards.first
  scorecard.turns = [
    FactoryGirl.create(:turn,
                       scorecard: scorecard,
                       score: 8),
    FactoryGirl.create(:turn,
                       scorecard: scorecard,
                       score: 4)]
  scorecard.save!
  expect(scorecard.total).to eql 12
end

step 'I navigate to rounds' do
  visit root_path
  page.find("a.left-off-canvas-toggle").click
  page.click_on(I18n.t('round.plural'))
end

step 'I should see the round' do
  expect(page).to have_content "Recent Rounds"
  expect(page).to have_content @course.name
  expect(page).to have_content @round.scorecards.first.total
end
