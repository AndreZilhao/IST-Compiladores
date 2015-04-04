# Compiladores-IST
Projectos de Compiladores

## Parte 1
### Implementação de um analisador léxico para a linguagem Mini-Java+

O objectivo é utilizar a ferramenta flex para reconhecer os tokens do
linguagem MiniJava+. A análise léxica deverá também reportar quaisquer tokens
inválidos no ficheiro de entrada.

Link para o projecto Mini-Java: http://www.cambridge.org/us/features/052182060X/mjreference/mjreference.html

## Descrição da Linguagem
A linguagem de programação MiniJava+ é baseada na linguagem MiniJava. A extensão proposta permite a leitura de valores inteiros, aumentando assim a versatilidade do compilador a ser realizado. A linguagem MiniJava
é um subconjunto da linguagem de programação Java. Assim, o significado de
qualquer programa em MiniJava corresponde ao significado do programa em Java. O
mesmo aplica-se a programas na linguagem MiniJava+.

## Sobre a Análise Léxica

Sobre a Análise Léxica
Os programas em MiniJava+ devem utilizar o código ASCII.
• Identificadores:
Um identificador é uma sequência de letras, digitos, e underscores, que começa com
uma letra. Letras maiusculas diferem das minusculas. Na definição da sintaxe, id
denota um identificador.
• Inteiros:
Uma sequência de digitos é uma constante inteira e representa o valor inteiro associado.
Na definição da sintaxe, INTEGER LITERAL denota uma constante inteira.
• Operadores binários:
Um operador binário é um de:
&& < + - *
Na defini¸cãoo de sintaxe, op denota um operador binário.
• Comentários:
Um comentário pode aparecer entre quaisquer dois tokens da linguagem. Existem
duas formas de comentários:
– Uma forma de comentário começaa em /* e termina em */.
– A outra forma de comentário começa em // e termina no fim da linha.
