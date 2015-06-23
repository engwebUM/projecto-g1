def create_user(first_name, last_name, email, password)
  FactoryGirl.create(:user, first_name: first_name, last_name: last_name,
                     email: email, password: password)
end

create_user('Admin', 'Test', 'admin@email.com', 'password')
create_user('Eduardo', 'Pinto', 'eduardo@email.com', 'qwertyuiop')
create_user('Frederico', 'Carvalho', 'fred@email.com', '12345qwerty')
create_user('Nuno', 'Dionísio', 'nunodio@email.com', 'nunodionisio')
create_user('Nuno', 'Gomes', 'nunogomes@email.com', 'password')
create_user('Nuno', 'Santos', 'nunomsantos@email.com', 'nunomsantos')

plans = [['Stone', 500], ['Gold', 2_000], ['Platinum', 4_000],
         ['Ruby Sponsor', 28_000], ['Host a Lunch', 2_000],
         ['Host the WiFi', 1_000], ['Host the Karaoke Party', 3_000],
         ['Host the Farewell Party', 2_000]]
plans.each do |plan|
  FactoryGirl.create(:plan, name: plan.first, price: plan.second)
end

states = [['suggested', false], ['contacted', false], ['pending', false],
          ['accepted', true], ['rejected', true]]
states.each do |state|
  FactoryGirl.create(:state, name: state.first, is_final: state.second)
end

User.all.each do |user|
  State.all.each do |state|
    FactoryGirl.create(:sponsor, user: user, state: state, plan: Plan.all.sample)
  end
end
