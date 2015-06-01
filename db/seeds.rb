def create_user(first_name, last_name, email, password)
  User.create(first_name: first_name, last_name: last_name,
              email: email, password: password)
end

def create_plan(name, number)
  Plan.create(name: name, slots: number, price: number.to_f, tickets: number,
              discount_coupon: number.to_f, discount_tickets: number,
              description: "#{name} plan description")
end

def create_sponsor(number, state, user, plan)
  Sponsor.create(organization: "Organization #{number}",
                 person_name: "Person #{number}", person_role: "Role #{number}",
                 person_email: "person#{number}@email.com",
                 person_phone: (number.to_s * 9)[0..8], extra_pay: number * 10.0,
                 state: state, next_step: 'Please try again',
                 notes: "A note about the #{number.ordinalize} sponsor.",
                 user_id: user.id, plan_id: plan.id)
end

@users = []
@users << create_user('Admin', 'Test', 'admin@email.com', 'password')
@users << create_user('Eduardo', 'Pinto', 'eduardo@email.com', 'qwertyuiop')
@users << create_user('Frederico', 'Carvalho', 'fred@email.com', '12345qwerty')
@users << create_user('Nuno', 'Dionísio', 'nunodio@email.com', 'nunodionisio')
@users << create_user('Nuno', 'Gomes', 'nunogomes@email.com', 'password')
@users << create_user('Nuno', 'Santos', 'nunomsantos@email.com', 'nunomsantos')

@plans = []
plans_names = %w(Stone Bronze Silver Gold Platinum)
plans_names.each_with_index do |name, index|
  @plans << create_plan(name, (index + 1) * 10)
end

@users.each_with_index do |user, index_user|
  State.all.each_with_index do |state, index_state|
    create_sponsor(index_state + 1 + index_user * @users.size, state, user, @plans[rand @plans.size])
  end
end
