# Realizzo 49 * 2500 = 122500 variabili aleatorie X_1, ... ,X_{122500} i.i.d.
# e con densità U(0,1) (= l'uniforme continua sull'intervallo [0,1]):

x <- runif( 122500, min = 0, max = 1 )

# Faccio l'istogramma di x (seguo la regola: num. classi = sqrt(num. dati),
# e allargo un pochino il range delle ascisse rispetto a quello che darebbe R
# in automatico).
# Ritrovo così la densità uniforme da cui ho estratto i dati come conseguenza
# della Legge dei Grandi Numeri (--> le frequenze empiriche delle classi
# convergono in probabilità alle probabilità teoriche):

graphics.off()
hist( x, breaks = sqrt(122500), xlim = c(-0.2, 1.2) )

# Creo una matrice con 49 righe e 2500 colonne impilando il vettore x colonna
# per colonna:

M = matrix( x, nrow = 49, ncol = 2500 )

# Calcolo la media campionaria dei 49 dati in ogni colonna, ottenendo così
# un vettore di 2500 medie campionarie:

barx <- apply( M, 2, mean )

# Faccio l'istogramma di queste medie campionarie (con la stessa regola di 
# prima per il num. di classi), e questa volta ritrovo la densità normale
# come conseguenza del Teorema del Limite Centrale.
# Come prima, la Legge dei Grandi Numeri mi garantisce la convergenza della
# densità empirica a quella teorica:

windows()
hist( barx, breaks = sqrt(2500) )

# Notare che l'istogramma delle medie campionarie è centrato in 1/2 (= il
# valore atteso di U(0,1)). Inoltre, quasi tutte le medie campionarie stanno
# tra 1/2 - 3 * sd(U(0,1)) / sqrt(49) e 1/2 + 3 * sd(U(0,1)) / sqrt(49),
# dove sd(U(0,1)) = sqrt(1/12) è la deviazione standard di U(0,1) e quindi
# sd(U(0,1)) / sqrt(49) è quella di una qualsiasi media campionaria.
# Per vedere meglio questo fatto, standardizzo le medie campionarie:

Z <- ( barx - 1/2 ) / ( sqrt(1/12) / sqrt(49) )

# e faccio l'istogramma delle standardizzazioni, ritrovando così la densità
# normale standard:

windows()
hist( Z, breaks = sqrt(2500) )

# Come ulteriore verifica, controllo che circa il 95% delle standardizzazioni
# stia tra -2 e +2, come previsto dalla densità normale standard:

length( Z[ Z>-2 & Z<+2 ] ) / 2500