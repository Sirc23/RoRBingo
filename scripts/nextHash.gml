var gamma = hex_to_dec("9E3779B97F4A7C15");

var z = state + gamma;
z = power(z,(z >> 30)) * hex_to_dec("BF58476D1CE4E5B9");
z = power(z,(z >> 27)) * hex_to_dec("94D049BB133111EB");
z = power(z, (z >> 31));
return z;
