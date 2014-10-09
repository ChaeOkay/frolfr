App.Course = DS.Model.extend({
<<<<<<< HEAD
  city: DS.attr('string'),
  state: DS.attr('string'),
  country: DS.attr('string'),
  name: DS.attr('string'),
  status: DS.attr('string'),
  location: DS.attr('string'),
  roundsPlayed: DS.attr('number'),
  rounds: DS.hasMany('round', { async: true }),
  holes: DS.hasMany('hole', { async: true })
=======
    city: DS.attr('string'),
    state: DS.attr('string'),
    country: DS.attr('string'),
    name: DS.attr('string'),
    status: DS.attr('string'),
    location: DS.attr('string'),
    roundsPlayed: DS.attr('number')
>>>>>>> 7d89bc391be5c773cf16d17dd27975888d1eb29c
});
