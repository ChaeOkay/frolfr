App.Course = DS.Model.extend({
  city: DS.attr('string'),
  state: DS.attr('string'),
  country: DS.attr('string'),
  name: DS.attr('string'),
  status: DS.attr('string'),
  location: DS.attr('string'),
  roundsPlayed: DS.attr('number'),
  rounds: DS.hasMany('round', { async: true }),
  holes: DS.hasMany('hole', { async: true })
});
