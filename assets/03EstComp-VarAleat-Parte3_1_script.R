##################### Exercício em R - Empresa de Limpeza (slide 4) ########################################

# limpar a memória do R de eventuais exercícios anteriores

rm(list=ls()) 

#CTRL + L para limpar a consola


###a)

#A nossa variável aleatória: X ~ procura diária serviços de limpeza

#Em primeiro lugar definir a função
fx = function(x){

  (x< 0.5)*0 +(0.5<=x & x<=1.5)*(2*x-1)+(x>1.5)*0
}

#ou em alternativa

fx1 <- function(x){
  ifelse((0.5<=x & x<=1.5), 2*x-1, 0)}


#Criar o gráfico em causa
plot(fx, 0, 2,xlim=c(0,2),n=1001)
plot(fx1, 0, 2,xlim=c(0,2),n=1001)



###b)


#Para vermos graficamente a área em causa
points(x = c(1,1.5,1.5,1),
       y = c(0,0,fx1(1.5),fx1(1)),
       pch = 16,
       col = "red")
polygon(c(1,1.5,1.5,1),c(0,0,fx1(1.5),fx1(1)),col="light yellow")

#A probabilidade pedida pode ser obtida usando a função integrate:
Prob <- integrate(fx, 1, 1.5, abs.tol = TRUE)
Prob$value

# Nota:o output da função integrate é uma lista. O número que procuramos está no campo value. 
# Podem usar a função str() para ver os campos da lista da função integrate.


####c)

# Para sabermos a receita diária esperada, primeiro precisamos de saber a procura diária esperada, 
# que é dada por E(X)
# Temos que criar uma nova função dado que, para calcular o valores esperado, 
# precisamos de ter o x a multiplicar pela função:
#
xfx <- function(x){
  ifelse((0.5<=x & x<=1.5), x*(2*x-1), 0)}

#Depois disto podemos calcular o integral da nova função para ter o valor esperado:
#
E_X=integrate(xfx, 0.5, 1.5)
E_X$value

# Para termos a receita diária teremos que multiplicar o valor por hora. 
# Não esquecer que o integral foi feito para centenas de horas, 
# portanto temos que encontrar o valor da receita para 100horas de trabalho, 
# ou seja, 10 * 100 
# Desta forma 
cat("A receita diária esperada é de:",round(10*100*E_X$value,digits=2),"u.m")




#####################  Uniforme Contínua - Exercício em R (slide) ########################################

# limpar a memória do R de eventuais exercícios anteriores

rm(list=ls()) 

#CTRL + L para limpar a consola


###1)

#Definir o valor para a e para b
a=9.95
b=10.05

#Utilizar a função curve para criar o gráfico em causa. Na expressão a considerar incluir a função densidade de probabilidade
# para uma uniforme (dunif)

curve(dunif(x, min = a, max = b),
      from = a-(b-a)/10, to = b+(b-a)/10,
      n = 1000,
      col = "darkblue",
      lwd = 2,
      ylab = 'f.d.p')

#Repetir o mesmo processo para a função distribuição, mas desta feita, utilizar a função punif que calcula probabilidades acumuladas
curve(punif(x, min = a, max = b),
      from = a-(b-a)/10, to = b+(b-a)/10,
      n = 1000,
      col = "darkblue",
      lwd = 2,
      ylab = 'F(x)')




###2)

#A probabilidade pretendida pode ser calculada da seguinte forma 
# (podemos recorrer diretamente à fórmula não precisamos de calcular 
# o integral)

punif(9.98,a,b,lower.tail=FALSE)

#OU em alternativa
1-punif(9.98,a,b)




###3)



#Calcular a probabilidade pedida, vendo a 
# percentagem de comprimidos acima de 9.98:

  mean(runif(10000, a, b) > 9.98)



