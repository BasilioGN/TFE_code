########################################
# DEMOSTRACIÓN FUNCIONAMIENTO SONIC PI #
#                -                     #
# DEFENSA TFE BASILIO GÓMEZ NAVARRO    #
########################################


# DEMOSTRACIÓN DE NOTAS SUELTAS:
play 50
play :D3
play :d3

# DEMOSTRACIÓN DE ACORDE PLACADO:
play chord(:E3, :minor)

# DEMOSTRACIÓN DE ACORDE ARPEGIADO:
play_pattern chord(:E3, :minor)

# DEMOSTRACIÓN DE ESCALA:
play_pattern_timed scale(:c3, :major), 0.125, release: 0.1

# DEMOSTRACIÓN DE SILENCIO:
play :d3 #hace sonar la nota Re de la 3ª octava.
sleep 1 #pausa la reproducción durante 1 segundo
play :e3 #hace sonar la nota Mi de la 3ª octava

# DEMOSTRACIÓN DE USO DE SINTETIZADOR CON FORMA DE ONDA CUADRADA:
use_synth :square
play 50

# DEMOSTRACIÓN DE ENVOLVENTE ADSR:
use_synth :square
play 50, attack: 0.5, decay: 1, sustain: 3, release: 0.5

# DEMOSTRACIÓN USO DE SAMPLES:
sample :ambi_choir #reproduce el sample llamado ambi_choir.
sample :loop_amen #reproduce el sample llamado loop_amen.

# DEMOSTRACIÓN GENERACIÓN DE NOTAS ALEATORIAS:
play rrand(50, 88)

# DEMOSTRACIÓN GENERACIÓN DE NOTAS ALEATORIAS EN BUCLE:
loop do
  play rrand(50, 88)
  sleep 0.5
end

# DEMOSTRACIÓN DE LA APLICACIÓN DE EFECTOS:
with_fx :reverb do # se aplica reverb.
  play 50
  sleep 0.5
  sample :elec_plip
  sleep 0.5
  play 62
end

# DEMOSTRACIÓN SINCRONIZACIÓN:
live_loop :main do
  sleep 4
end

live_loop :counterpoint_A do
  sync :main
  use_synth :sine
  play_rand_counterpoint(0.3) # función de ejemplo no declarada.
end


