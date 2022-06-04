var myStr = argument0;
var seed = 0;
for (i = 0; i < string_byte_length(myStr); i += 1) {
  seed = (seed + string_byte_at(myStr, i)) << 1;
}
return seed;
